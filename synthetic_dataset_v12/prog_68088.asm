; DESCRIPTION: Renders a black line between points (256, 104) and (362, 30).
; PLAN: r0=256(x1), r1=104(y1), r2=362(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 104
LDI r2, 362
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
