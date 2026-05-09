; DESCRIPTION: Places a white line segment connecting (24, 106) to (81, 8).
; PLAN: r0=24(x1), r1=106(y1), r2=81(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 106
LDI r2, 81
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
