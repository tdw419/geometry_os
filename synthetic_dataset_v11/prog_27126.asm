; DESCRIPTION: Renders a white line between points (43, 144) and (64, 126).
; PLAN: r0=43(x1), r1=144(y1), r2=64(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 144
LDI r2, 64
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
