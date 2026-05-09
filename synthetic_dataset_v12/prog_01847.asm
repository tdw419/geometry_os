; DESCRIPTION: Renders a black line between points (40, 12) and (398, 184).
; PLAN: r0=40(x1), r1=12(y1), r2=398(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 12
LDI r2, 398
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
