; DESCRIPTION: Composite: Places a blue line segment connecting (301, 211) to (419, 6) then Renders a blue box of size 55x90 starting at (49, 118) then Sets a single cyan pixel at (130, 236).
; PLAN: r0=301(x1), r1=211(y1), r2=419(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=118(y), r7=55(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x), r11=236(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 211
LDI r2, 419
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 118
LDI r7, 55
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 236
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
