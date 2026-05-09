; DESCRIPTION: Places a orange line segment connecting (82, 105) to (19, 228).
; PLAN: r0=82(x1), r1=105(y1), r2=19(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 105
LDI r2, 19
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
