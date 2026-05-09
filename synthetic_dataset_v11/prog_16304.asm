; DESCRIPTION: Renders a cyan line between points (81, 53) and (238, 15).
; PLAN: r0=81(x1), r1=53(y1), r2=238(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 53
LDI r2, 238
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
