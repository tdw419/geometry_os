; DESCRIPTION: Places a white line segment connecting (81, 167) to (242, 200).
; PLAN: r0=81(x1), r1=167(y1), r2=242(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 167
LDI r2, 242
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
