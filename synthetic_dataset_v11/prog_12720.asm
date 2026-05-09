; DESCRIPTION: Places a yellow line segment connecting (172, 210) to (115, 21).
; PLAN: r0=172(x1), r1=210(y1), r2=115(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 210
LDI r2, 115
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
