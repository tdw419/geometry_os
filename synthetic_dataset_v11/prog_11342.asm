; DESCRIPTION: Places a yellow line segment connecting (166, 180) to (205, 21).
; PLAN: r0=166(x1), r1=180(y1), r2=205(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 180
LDI r2, 205
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
