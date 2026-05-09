; DESCRIPTION: Renders a orange line between points (213, 249) and (65, 101).
; PLAN: r0=213(x1), r1=249(y1), r2=65(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 249
LDI r2, 65
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
