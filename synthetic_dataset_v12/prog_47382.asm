; DESCRIPTION: Renders a red line between points (154, 49) and (258, 38).
; PLAN: r0=154(x1), r1=49(y1), r2=258(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 49
LDI r2, 258
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
