; DESCRIPTION: Renders a green line between points (171, 250) and (143, 116).
; PLAN: r0=171(x1), r1=250(y1), r2=143(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 250
LDI r2, 143
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
