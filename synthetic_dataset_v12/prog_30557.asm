; DESCRIPTION: Places a cyan line segment connecting (159, 29) to (477, 134).
; PLAN: r0=159(x1), r1=29(y1), r2=477(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 29
LDI r2, 477
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
