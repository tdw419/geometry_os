; DESCRIPTION: Places a red line segment connecting (179, 237) to (409, 186).
; PLAN: r0=179(x1), r1=237(y1), r2=409(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 237
LDI r2, 409
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
