; DESCRIPTION: Renders a black line between points (368, 36) and (70, 220).
; PLAN: r0=368(x1), r1=36(y1), r2=70(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 36
LDI r2, 70
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
