; DESCRIPTION: Renders a black line between points (128, 140) and (408, 95).
; PLAN: r0=128(x1), r1=140(y1), r2=408(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 140
LDI r2, 408
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
