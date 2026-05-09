; DESCRIPTION: Places a purple line segment connecting (88, 228) to (128, 222).
; PLAN: r0=88(x1), r1=228(y1), r2=128(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 228
LDI r2, 128
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
