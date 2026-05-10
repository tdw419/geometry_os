; DESCRIPTION: Renders a red line segment connecting (126, 115) to (330, 31).
; PLAN: r0=126(x1), r1=115(y1), r2=330(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 115
LDI r2, 330
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
