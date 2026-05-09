; DESCRIPTION: Composite: Places a blue 31x29 rectangle at position (429, 136) then Renders a yellow line between points (370, 222) and (39, 201).
; PLAN: r0=429(x), r1=136(y), r2=31(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x1), r6=222(y1), r7=39(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 136
LDI r2, 31
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 222
LDI r7, 39
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
