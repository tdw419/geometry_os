; DESCRIPTION: Draws a white line from (443, 119) to (334, 161).
; PLAN: r0=443(x1), r1=119(y1), r2=334(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 119
LDI r2, 334
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
