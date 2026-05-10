; DESCRIPTION: Places a orange line segment connecting (177, 66) to (140, 228).
; PLAN: r0=177(x1), r1=66(y1), r2=140(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 66
LDI r2, 140
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
