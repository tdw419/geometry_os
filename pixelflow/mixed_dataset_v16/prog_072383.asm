; DESCRIPTION: Renders a black line between points (434, 196) and (184, 0).
; PLAN: r0=434(x1), r1=196(y1), r2=184(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 196
LDI r2, 184
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
