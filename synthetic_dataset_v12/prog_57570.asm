; DESCRIPTION: Renders a yellow line between points (360, 116) and (444, 107).
; PLAN: r0=360(x1), r1=116(y1), r2=444(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 116
LDI r2, 444
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
