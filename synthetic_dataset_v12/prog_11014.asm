; DESCRIPTION: Renders a black line between points (488, 196) and (253, 30).
; PLAN: r0=488(x1), r1=196(y1), r2=253(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 196
LDI r2, 253
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
