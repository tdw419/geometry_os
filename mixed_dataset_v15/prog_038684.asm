; DESCRIPTION: Places a blue line segment connecting (443, 221) to (467, 72).
; PLAN: r0=443(x1), r1=221(y1), r2=467(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 221
LDI r2, 467
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
