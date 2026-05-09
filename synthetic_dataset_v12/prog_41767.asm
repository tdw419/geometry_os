; DESCRIPTION: Places a blue line segment connecting (367, 146) to (167, 0).
; PLAN: r0=367(x1), r1=146(y1), r2=167(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 146
LDI r2, 167
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
