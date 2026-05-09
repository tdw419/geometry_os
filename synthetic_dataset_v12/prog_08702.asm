; DESCRIPTION: Renders a cyan line between points (34, 111) and (134, 105).
; PLAN: r0=34(x1), r1=111(y1), r2=134(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 111
LDI r2, 134
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
