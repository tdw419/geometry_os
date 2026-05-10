; DESCRIPTION: Draws a blue line from (275, 49) to (262, 1).
; PLAN: r0=275(x1), r1=49(y1), r2=262(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 49
LDI r2, 262
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
