; DESCRIPTION: Renders a black line between points (114, 244) and (75, 42).
; PLAN: r0=114(x1), r1=244(y1), r2=75(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 244
LDI r2, 75
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
