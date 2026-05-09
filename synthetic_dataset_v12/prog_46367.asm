; DESCRIPTION: Renders a black line between points (56, 29) and (400, 242).
; PLAN: r0=56(x1), r1=29(y1), r2=400(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 29
LDI r2, 400
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
