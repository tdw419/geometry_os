; DESCRIPTION: Draws a red line from (89, 239) to (4, 139).
; PLAN: r0=89(x1), r1=239(y1), r2=4(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 239
LDI r2, 4
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
