; DESCRIPTION: Composite: Places a black dot at position (37, 105) then Places a white 120x97 rectangle at position (340, 126).
; PLAN: r0=37(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=126(y), r7=120(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 340
LDI r6, 126
LDI r7, 120
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
