; DESCRIPTION: Draws a green line from (58, 33) to (179, 254).
; PLAN: r0=58(x1), r1=33(y1), r2=179(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 33
LDI r2, 179
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
