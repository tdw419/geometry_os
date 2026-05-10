; DESCRIPTION: Renders a green line between points (120, 116) and (116, 94).
; PLAN: r0=120(x1), r1=116(y1), r2=116(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 116
LDI r2, 116
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
