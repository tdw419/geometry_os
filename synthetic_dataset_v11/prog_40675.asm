; DESCRIPTION: Renders a cyan line between points (92, 75) and (121, 238).
; PLAN: r0=92(x1), r1=75(y1), r2=121(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 75
LDI r2, 121
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
