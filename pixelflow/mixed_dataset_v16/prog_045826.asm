; DESCRIPTION: Renders a cyan line between points (212, 20) and (395, 159).
; PLAN: r0=212(x1), r1=20(y1), r2=395(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 20
LDI r2, 395
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
