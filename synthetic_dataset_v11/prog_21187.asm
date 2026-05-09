; DESCRIPTION: Draws a magenta line from (255, 35) to (5, 253).
; PLAN: r0=255(x1), r1=35(y1), r2=5(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 35
LDI r2, 5
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
