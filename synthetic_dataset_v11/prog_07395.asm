; DESCRIPTION: Renders a white line between points (198, 144) and (190, 109).
; PLAN: r0=198(x1), r1=144(y1), r2=190(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 144
LDI r2, 190
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
