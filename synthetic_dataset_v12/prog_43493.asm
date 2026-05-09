; DESCRIPTION: Renders a black line between points (128, 114) and (298, 220).
; PLAN: r0=128(x1), r1=114(y1), r2=298(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 114
LDI r2, 298
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
