; DESCRIPTION: Renders a black line between points (16, 82) and (5, 221).
; PLAN: r0=16(x1), r1=82(y1), r2=5(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 82
LDI r2, 5
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
