; DESCRIPTION: Renders a black line between points (370, 237) and (167, 55).
; PLAN: r0=370(x1), r1=237(y1), r2=167(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 237
LDI r2, 167
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
