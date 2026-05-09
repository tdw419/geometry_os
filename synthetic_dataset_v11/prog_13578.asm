; DESCRIPTION: Renders a white line between points (86, 4) and (113, 109).
; PLAN: r0=86(x1), r1=4(y1), r2=113(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 4
LDI r2, 113
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
