; DESCRIPTION: Draws a green line from (33, 3) to (14, 168).
; PLAN: r0=33(x1), r1=3(y1), r2=14(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 3
LDI r2, 14
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
