; DESCRIPTION: Places a green line segment connecting (74, 81) to (29, 242).
; PLAN: r0=74(x1), r1=81(y1), r2=29(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 81
LDI r2, 29
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
