; DESCRIPTION: Renders a black line between points (111, 23) and (95, 195).
; PLAN: r0=111(x1), r1=23(y1), r2=95(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 23
LDI r2, 95
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
