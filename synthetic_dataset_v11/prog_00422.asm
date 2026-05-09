; DESCRIPTION: Renders a black line between points (72, 94) and (43, 42).
; PLAN: r0=72(x1), r1=94(y1), r2=43(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 94
LDI r2, 43
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
