; DESCRIPTION: Renders a black line between points (460, 233) and (435, 83).
; PLAN: r0=460(x1), r1=233(y1), r2=435(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 233
LDI r2, 435
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
