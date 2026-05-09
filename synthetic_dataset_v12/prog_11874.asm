; DESCRIPTION: Draws a blue line from (157, 157) to (290, 253).
; PLAN: r0=157(x1), r1=157(y1), r2=290(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 157
LDI r2, 290
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
