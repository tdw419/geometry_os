; DESCRIPTION: Renders a white line between points (293, 25) and (443, 214).
; PLAN: r0=293(x1), r1=25(y1), r2=443(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 25
LDI r2, 443
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
