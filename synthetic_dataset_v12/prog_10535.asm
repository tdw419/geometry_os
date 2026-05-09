; DESCRIPTION: Composite: Places a green line segment connecting (306, 190) to (428, 118) then Places a white dot at position (5, 185) then Places a orange 92x28 rectangle at position (225, 133).
; PLAN: r0=306(x1), r1=190(y1), r2=428(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=185(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=133(y), r12=92(width), r13=28(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 190
LDI r2, 428
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 185
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 225
LDI r11, 133
LDI r12, 92
LDI r13, 28
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
