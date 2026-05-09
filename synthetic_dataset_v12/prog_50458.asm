; DESCRIPTION: Renders a green line between points (443, 231) and (449, 116).
; PLAN: r0=443(x1), r1=231(y1), r2=449(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 231
LDI r2, 449
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
