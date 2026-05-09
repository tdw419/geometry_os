; DESCRIPTION: Renders a red line between points (409, 210) and (193, 174).
; PLAN: r0=409(x1), r1=210(y1), r2=193(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 210
LDI r2, 193
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
