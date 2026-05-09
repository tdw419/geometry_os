; DESCRIPTION: Draws a blue line from (28, 125) to (386, 88).
; PLAN: r0=28(x1), r1=125(y1), r2=386(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 125
LDI r2, 386
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
