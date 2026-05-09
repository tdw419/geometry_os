; DESCRIPTION: Places a orange line segment connecting (106, 32) to (42, 16).
; PLAN: r0=106(x1), r1=32(y1), r2=42(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 32
LDI r2, 42
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
