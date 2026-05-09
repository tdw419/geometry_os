; DESCRIPTION: Renders a black line between points (42, 95) and (3, 225).
; PLAN: r0=42(x1), r1=95(y1), r2=3(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 95
LDI r2, 3
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
