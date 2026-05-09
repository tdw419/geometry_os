; DESCRIPTION: Renders a black line between points (509, 42) and (105, 218).
; PLAN: r0=509(x1), r1=42(y1), r2=105(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 42
LDI r2, 105
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
