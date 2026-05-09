; DESCRIPTION: Composite: Places a green 51x104 rectangle at position (51, 99) then Places a purple line segment connecting (300, 157) to (489, 249).
; PLAN: r0=51(x), r1=99(y), r2=51(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x1), r6=157(y1), r7=489(x2), r8=249(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 99
LDI r2, 51
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 157
LDI r7, 489
LDI r8, 249
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
