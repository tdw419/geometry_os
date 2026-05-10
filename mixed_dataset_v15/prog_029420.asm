; DESCRIPTION: Composite: Draws a white line from (470, 96) to (354, 78) then Places a orange dot at position (467, 163).
; PLAN: r0=470(x1), r1=96(y1), r2=354(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=163(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 96
LDI r2, 354
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 163
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
