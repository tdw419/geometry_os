; DESCRIPTION: Draws a blue line from (475, 253) to (237, 204).
; PLAN: r0=475(x1), r1=253(y1), r2=237(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 253
LDI r2, 237
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
