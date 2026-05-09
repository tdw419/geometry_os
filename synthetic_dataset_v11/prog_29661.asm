; DESCRIPTION: Renders a black line between points (242, 120) and (122, 7).
; PLAN: r0=242(x1), r1=120(y1), r2=122(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 120
LDI r2, 122
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
