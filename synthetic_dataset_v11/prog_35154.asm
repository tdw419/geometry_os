; DESCRIPTION: Renders a white line between points (242, 116) and (179, 84).
; PLAN: r0=242(x1), r1=116(y1), r2=179(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 116
LDI r2, 179
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
