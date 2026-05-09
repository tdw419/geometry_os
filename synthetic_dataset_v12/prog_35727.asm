; DESCRIPTION: Places a blue line segment connecting (52, 167) to (262, 242).
; PLAN: r0=52(x1), r1=167(y1), r2=262(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 167
LDI r2, 262
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
