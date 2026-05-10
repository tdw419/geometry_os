; DESCRIPTION: Renders a yellow line between points (443, 110) and (24, 228).
; PLAN: r0=443(x1), r1=110(y1), r2=24(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 110
LDI r2, 24
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
