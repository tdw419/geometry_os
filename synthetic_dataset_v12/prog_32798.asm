; DESCRIPTION: Draws a blue line from (397, 0) to (168, 211).
; PLAN: r0=397(x1), r1=0(y1), r2=168(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 0
LDI r2, 168
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
