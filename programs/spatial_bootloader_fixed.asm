; Geometry OS Spatial Bootloader
; Navigation = Execution
; Click a map pixel to trigger execution at that address
; Uses MOUSEQ (1 reg: x→rX, y→rX+1, buttons→rX+2)

main:
    FRAME               ; Sync with display
    MOUSEQ r1           ; r1=x, r2=y, r3=buttons
    HILBERT_XY2D r4, r1, r2  ; Get Hilbert Index (The Key)

    ; If mouse is clicked (r3 != 0), dispatch
    LDI r0, 0
    SUB r5, r3, r0
    JNZ r5, dispatch

    JMP main

dispatch:
    ; Store the Hilbert index as an address and jump
    ; (JMP takes immediate, so we use CALL with computed addr)
    CALL r4             ; Execute the fragment at this coordinate
    JMP main
