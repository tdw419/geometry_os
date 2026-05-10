; DESCRIPTION: Renders a red line between points (309, 139) and (333, 3).
; PLAN: r0=309(x1), r1=139(y1), r2=333(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 139
LDI r2, 333
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
