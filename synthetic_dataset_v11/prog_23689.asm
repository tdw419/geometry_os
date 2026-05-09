; DESCRIPTION: Renders a black line between points (104, 6) and (103, 195).
; PLAN: r0=104(x1), r1=6(y1), r2=103(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 6
LDI r2, 103
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
