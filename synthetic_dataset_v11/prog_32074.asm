; DESCRIPTION: Draws a blue line from (75, 255) to (253, 220).
; PLAN: r0=75(x1), r1=255(y1), r2=253(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 255
LDI r2, 253
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
