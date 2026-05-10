; DESCRIPTION: Places a magenta line segment connecting (304, 192) to (503, 230).
; PLAN: r0=304(x1), r1=192(y1), r2=503(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 192
LDI r2, 503
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
