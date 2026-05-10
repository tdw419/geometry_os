; DESCRIPTION: Composite: Renders a purple box of size 74x81 starting at (13, 160) then Places a red dot at position (37, 139) then Places a yellow line segment connecting (409, 234) to (193, 246).
; PLAN: r0=13(x), r1=160(y), r2=74(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=139(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=409(x1), r11=234(y1), r12=193(x2), r13=246(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 160
LDI r2, 74
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 139
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 409
LDI r11, 234
LDI r12, 193
LDI r13, 246
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
