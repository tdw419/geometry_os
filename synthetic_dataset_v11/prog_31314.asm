; DESCRIPTION: Places a orange line segment connecting (234, 114) to (146, 42).
; PLAN: r0=234(x1), r1=114(y1), r2=146(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 114
LDI r2, 146
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
