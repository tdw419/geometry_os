; DESCRIPTION: Renders a black line between points (310, 150) and (37, 50).
; PLAN: r0=310(x1), r1=150(y1), r2=37(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 150
LDI r2, 37
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
