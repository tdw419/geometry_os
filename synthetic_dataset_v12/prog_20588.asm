; DESCRIPTION: Composite: Places a orange line segment connecting (10, 124) to (145, 92) then Renders a white box of size 45x40 starting at (251, 100) then Places a cyan dot at position (46, 112).
; PLAN: r0=10(x1), r1=124(y1), r2=145(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=100(y), r7=45(width), r8=40(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x), r11=112(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 10
LDI r1, 124
LDI r2, 145
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 100
LDI r7, 45
LDI r8, 40
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 112
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
