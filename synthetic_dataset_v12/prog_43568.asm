; DESCRIPTION: Places a orange line segment connecting (360, 209) to (81, 91).
; PLAN: r0=360(x1), r1=209(y1), r2=81(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 209
LDI r2, 81
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
