; DESCRIPTION: Renders a red line between points (274, 43) and (352, 220).
; PLAN: r0=274(x1), r1=43(y1), r2=352(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 43
LDI r2, 352
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
