; DESCRIPTION: Places a green line segment connecting (463, 120) to (184, 241).
; PLAN: r0=463(x1), r1=120(y1), r2=184(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 120
LDI r2, 184
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
