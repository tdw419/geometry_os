; DESCRIPTION: Renders a black line between points (30, 82) and (457, 210).
; PLAN: r0=30(x1), r1=82(y1), r2=457(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 82
LDI r2, 457
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
