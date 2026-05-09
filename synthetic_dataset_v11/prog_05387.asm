; DESCRIPTION: Places a orange line segment connecting (228, 223) to (213, 158).
; PLAN: r0=228(x1), r1=223(y1), r2=213(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 223
LDI r2, 213
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
