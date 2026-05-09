; DESCRIPTION: Renders a red line between points (443, 161) and (50, 254).
; PLAN: r0=443(x1), r1=161(y1), r2=50(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 161
LDI r2, 50
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
