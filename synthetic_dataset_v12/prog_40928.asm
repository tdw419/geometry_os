; DESCRIPTION: Renders a black line between points (443, 207) and (151, 208).
; PLAN: r0=443(x1), r1=207(y1), r2=151(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 207
LDI r2, 151
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
