; DESCRIPTION: Renders a red line between points (187, 122) and (193, 191).
; PLAN: r0=187(x1), r1=122(y1), r2=193(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 122
LDI r2, 193
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
