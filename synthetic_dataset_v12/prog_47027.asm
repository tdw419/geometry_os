; DESCRIPTION: Draws a blue line from (109, 165) to (397, 208).
; PLAN: r0=109(x1), r1=165(y1), r2=397(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 165
LDI r2, 397
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
