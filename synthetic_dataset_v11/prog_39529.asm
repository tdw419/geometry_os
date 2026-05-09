; DESCRIPTION: Renders a white line between points (116, 149) and (207, 139).
; PLAN: r0=116(x1), r1=149(y1), r2=207(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 149
LDI r2, 207
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
