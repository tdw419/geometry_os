; DESCRIPTION: Composite: Places a blue 107x34 rectangle at position (11, 215) then Places a purple line segment connecting (321, 105) to (91, 201).
; PLAN: r0=11(x), r1=215(y), r2=107(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=105(y1), r7=91(x2), r8=201(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 215
LDI r2, 107
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 105
LDI r7, 91
LDI r8, 201
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
