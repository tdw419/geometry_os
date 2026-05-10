; DESCRIPTION: Renders a cyan line between points (183, 50) and (35, 34).
; PLAN: r0=183(x1), r1=50(y1), r2=35(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 50
LDI r2, 35
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
