; DESCRIPTION: Renders a black line between points (229, 42) and (61, 45).
; PLAN: r0=229(x1), r1=42(y1), r2=61(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 42
LDI r2, 61
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
