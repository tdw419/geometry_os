; DESCRIPTION: Places a blue line segment connecting (113, 18) to (42, 112).
; PLAN: r0=113(x1), r1=18(y1), r2=42(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 18
LDI r2, 42
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
