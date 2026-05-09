; DESCRIPTION: Renders a black line between points (166, 95) and (242, 100).
; PLAN: r0=166(x1), r1=95(y1), r2=242(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 95
LDI r2, 242
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
