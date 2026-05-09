; DESCRIPTION: Draws a blue line from (168, 219) to (254, 71).
; PLAN: r0=168(x1), r1=219(y1), r2=254(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 219
LDI r2, 254
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
