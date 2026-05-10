; DESCRIPTION: Renders a orange line segment connecting (373, 113) to (277, 174).
; PLAN: r0=373(x1), r1=113(y1), r2=277(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 113
LDI r2, 277
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
