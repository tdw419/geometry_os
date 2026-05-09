; DESCRIPTION: Places a blue line segment connecting (96, 52) to (202, 242).
; PLAN: r0=96(x1), r1=52(y1), r2=202(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 52
LDI r2, 202
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
