; DESCRIPTION: Renders a black line between points (209, 60) and (374, 93).
; PLAN: r0=209(x1), r1=60(y1), r2=374(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 60
LDI r2, 374
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
