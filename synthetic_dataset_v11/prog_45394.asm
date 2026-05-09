; DESCRIPTION: Places a white line segment connecting (52, 36) to (91, 192).
; PLAN: r0=52(x1), r1=36(y1), r2=91(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 36
LDI r2, 91
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
