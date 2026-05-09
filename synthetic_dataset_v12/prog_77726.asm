; DESCRIPTION: Draws a blue line from (168, 165) to (371, 142).
; PLAN: r0=168(x1), r1=165(y1), r2=371(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 165
LDI r2, 371
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
