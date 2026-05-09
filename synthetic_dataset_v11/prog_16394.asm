; DESCRIPTION: Renders a black line between points (152, 237) and (220, 53).
; PLAN: r0=152(x1), r1=237(y1), r2=220(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 237
LDI r2, 220
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
