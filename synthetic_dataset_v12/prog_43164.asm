; DESCRIPTION: Places a orange line segment connecting (320, 54) to (265, 209).
; PLAN: r0=320(x1), r1=54(y1), r2=265(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 54
LDI r2, 265
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
