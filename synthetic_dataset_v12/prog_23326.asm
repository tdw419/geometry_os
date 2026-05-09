; DESCRIPTION: Draws a blue line from (297, 27) to (491, 14).
; PLAN: r0=297(x1), r1=27(y1), r2=491(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 27
LDI r2, 491
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
