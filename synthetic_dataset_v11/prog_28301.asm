; DESCRIPTION: Renders a white line between points (190, 8) and (128, 168).
; PLAN: r0=190(x1), r1=8(y1), r2=128(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 8
LDI r2, 128
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
