; DESCRIPTION: Renders a green line between points (116, 252) and (70, 38).
; PLAN: r0=116(x1), r1=252(y1), r2=70(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 252
LDI r2, 70
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
