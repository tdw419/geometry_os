; DESCRIPTION: Composite: Places a white dot at position (263, 111) then Draws a red line from (242, 197) to (203, 166).
; PLAN: r0=263(x), r1=111(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=197(y1), r7=203(x2), r8=166(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 111
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 197
LDI r7, 203
LDI r8, 166
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
