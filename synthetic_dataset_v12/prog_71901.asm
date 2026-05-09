; DESCRIPTION: Places a white line segment connecting (263, 3) to (245, 12).
; PLAN: r0=263(x1), r1=3(y1), r2=245(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 3
LDI r2, 245
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
