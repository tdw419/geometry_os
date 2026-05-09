; DESCRIPTION: Renders a white line between points (1, 198) and (24, 42).
; PLAN: r0=1(x1), r1=198(y1), r2=24(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 198
LDI r2, 24
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
