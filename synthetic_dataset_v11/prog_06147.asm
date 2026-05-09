; DESCRIPTION: Draws a blue line from (40, 5) to (205, 134).
; PLAN: r0=40(x1), r1=5(y1), r2=205(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 5
LDI r2, 205
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
