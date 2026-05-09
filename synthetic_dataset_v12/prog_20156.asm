; DESCRIPTION: Renders a black line between points (271, 209) and (164, 106).
; PLAN: r0=271(x1), r1=209(y1), r2=164(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 209
LDI r2, 164
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
