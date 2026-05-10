; DESCRIPTION: Renders a white line between points (125, 171) and (108, 93).
; PLAN: r0=125(x1), r1=171(y1), r2=108(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 171
LDI r2, 108
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
