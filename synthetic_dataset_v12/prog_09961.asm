; DESCRIPTION: Renders a cyan line between points (370, 109) and (238, 72).
; PLAN: r0=370(x1), r1=109(y1), r2=238(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 109
LDI r2, 238
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
