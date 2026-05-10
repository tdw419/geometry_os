; DESCRIPTION: Renders a black line between points (132, 134) and (53, 111).
; PLAN: r0=132(x1), r1=134(y1), r2=53(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 134
LDI r2, 53
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
