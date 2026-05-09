; DESCRIPTION: Renders a green line between points (407, 207) and (116, 143).
; PLAN: r0=407(x1), r1=207(y1), r2=116(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 207
LDI r2, 116
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
