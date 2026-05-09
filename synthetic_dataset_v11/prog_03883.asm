; DESCRIPTION: Places a purple line segment connecting (157, 228) to (199, 155).
; PLAN: r0=157(x1), r1=228(y1), r2=199(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 228
LDI r2, 199
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
