; DESCRIPTION: Places a white line segment connecting (167, 99) to (90, 16).
; PLAN: r0=167(x1), r1=99(y1), r2=90(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 99
LDI r2, 90
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
