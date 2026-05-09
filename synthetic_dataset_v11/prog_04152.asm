; DESCRIPTION: Renders a yellow line between points (251, 116) and (254, 143).
; PLAN: r0=251(x1), r1=116(y1), r2=254(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 116
LDI r2, 254
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
