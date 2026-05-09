; DESCRIPTION: Places a blue line segment connecting (82, 210) to (105, 165).
; PLAN: r0=82(x1), r1=210(y1), r2=105(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 210
LDI r2, 105
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
