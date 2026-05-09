; DESCRIPTION: Places a orange line segment connecting (507, 209) to (42, 75).
; PLAN: r0=507(x1), r1=209(y1), r2=42(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 209
LDI r2, 42
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
