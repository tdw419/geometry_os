; DESCRIPTION: Renders a black line between points (128, 37) and (184, 38).
; PLAN: r0=128(x1), r1=37(y1), r2=184(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 37
LDI r2, 184
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
