; DESCRIPTION: Renders a black line between points (6, 42) and (186, 8).
; PLAN: r0=6(x1), r1=42(y1), r2=186(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 42
LDI r2, 186
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
