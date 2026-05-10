; DESCRIPTION: Composite: Places a purple line segment connecting (277, 83) to (58, 238) then Renders a green box of size 107x103 starting at (266, 136).
; PLAN: r0=277(x1), r1=83(y1), r2=58(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=136(y), r7=107(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 83
LDI r2, 58
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 136
LDI r7, 107
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
