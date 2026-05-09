; DESCRIPTION: Draws a white line from (443, 159) to (225, 254).
; PLAN: r0=443(x1), r1=159(y1), r2=225(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 159
LDI r2, 225
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
