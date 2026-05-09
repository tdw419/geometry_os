; DESCRIPTION: Renders a black line between points (32, 8) and (220, 176).
; PLAN: r0=32(x1), r1=8(y1), r2=220(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 8
LDI r2, 220
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
