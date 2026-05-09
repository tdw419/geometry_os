; DESCRIPTION: Renders a orange line between points (175, 151) and (40, 174).
; PLAN: r0=175(x1), r1=151(y1), r2=40(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 151
LDI r2, 40
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
