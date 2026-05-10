; DESCRIPTION: Draws a blue line from (23, 121) to (329, 10).
; PLAN: r0=23(x1), r1=121(y1), r2=329(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 121
LDI r2, 329
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
