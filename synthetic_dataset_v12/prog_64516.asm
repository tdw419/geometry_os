; DESCRIPTION: Places a orange line segment connecting (408, 209) to (357, 42).
; PLAN: r0=408(x1), r1=209(y1), r2=357(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 209
LDI r2, 357
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
