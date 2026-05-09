; DESCRIPTION: Places a orange line segment connecting (9, 228) to (168, 176).
; PLAN: r0=9(x1), r1=228(y1), r2=168(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 228
LDI r2, 168
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
