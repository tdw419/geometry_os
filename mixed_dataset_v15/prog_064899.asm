; DESCRIPTION: Renders a cyan line between points (402, 77) and (469, 88).
; PLAN: r0=402(x1), r1=77(y1), r2=469(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 77
LDI r2, 469
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
