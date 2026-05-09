; DESCRIPTION: Renders a black line between points (253, 42) and (425, 223).
; PLAN: r0=253(x1), r1=42(y1), r2=425(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 42
LDI r2, 425
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
