; DESCRIPTION: Places a black line segment connecting (63, 176) to (179, 221).
; PLAN: r0=63(x1), r1=176(y1), r2=179(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 176
LDI r2, 179
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
