; DESCRIPTION: Renders a orange line between points (293, 209) and (384, 155).
; PLAN: r0=293(x1), r1=209(y1), r2=384(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 209
LDI r2, 384
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
