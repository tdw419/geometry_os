; DESCRIPTION: Renders a cyan line between points (450, 11) and (60, 238).
; PLAN: r0=450(x1), r1=11(y1), r2=60(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 11
LDI r2, 60
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
