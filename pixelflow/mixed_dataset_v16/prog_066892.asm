; DESCRIPTION: Renders a cyan line between points (317, 167) and (443, 155).
; PLAN: r0=317(x1), r1=167(y1), r2=443(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 167
LDI r2, 443
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
