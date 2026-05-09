; DESCRIPTION: Places a orange line segment connecting (74, 17) to (426, 113).
; PLAN: r0=74(x1), r1=17(y1), r2=426(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 17
LDI r2, 426
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
