; DESCRIPTION: Places a orange line segment connecting (71, 173) to (74, 144).
; PLAN: r0=71(x1), r1=173(y1), r2=74(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 173
LDI r2, 74
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
