; DESCRIPTION: Renders a orange line between points (103, 84) and (499, 61).
; PLAN: r0=103(x1), r1=84(y1), r2=499(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 84
LDI r2, 499
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
