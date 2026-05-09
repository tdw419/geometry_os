; DESCRIPTION: Places a purple line segment connecting (82, 196) to (228, 206).
; PLAN: r0=82(x1), r1=196(y1), r2=228(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 196
LDI r2, 228
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
