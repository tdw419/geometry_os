; DESCRIPTION: Places a yellow line segment connecting (111, 172) to (50, 206).
; PLAN: r0=111(x1), r1=172(y1), r2=50(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 172
LDI r2, 50
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
