; DESCRIPTION: Draws a blue line from (132, 253) to (183, 16).
; PLAN: r0=132(x1), r1=253(y1), r2=183(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 253
LDI r2, 183
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
