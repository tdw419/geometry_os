; DESCRIPTION: Renders a black line between points (255, 183) and (463, 42).
; PLAN: r0=255(x1), r1=183(y1), r2=463(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 183
LDI r2, 463
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
