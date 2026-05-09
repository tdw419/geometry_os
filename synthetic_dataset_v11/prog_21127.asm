; DESCRIPTION: Places a green line segment connecting (81, 167) to (21, 54).
; PLAN: r0=81(x1), r1=167(y1), r2=21(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 167
LDI r2, 21
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
