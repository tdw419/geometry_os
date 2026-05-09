; DESCRIPTION: Renders a orange line between points (171, 44) and (141, 182).
; PLAN: r0=171(x1), r1=44(y1), r2=141(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 44
LDI r2, 141
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
