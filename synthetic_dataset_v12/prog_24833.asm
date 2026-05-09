; DESCRIPTION: Renders a black line between points (311, 135) and (242, 193).
; PLAN: r0=311(x1), r1=135(y1), r2=242(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 135
LDI r2, 242
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
