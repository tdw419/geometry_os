; DESCRIPTION: Renders a cyan line between points (53, 250) and (134, 72).
; PLAN: r0=53(x1), r1=250(y1), r2=134(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 250
LDI r2, 134
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
