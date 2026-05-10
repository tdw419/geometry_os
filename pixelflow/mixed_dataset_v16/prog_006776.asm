; DESCRIPTION: Renders a orange line segment connecting (44, 121) to (146, 113).
; PLAN: r0=44(x1), r1=121(y1), r2=146(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 121
LDI r2, 146
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
