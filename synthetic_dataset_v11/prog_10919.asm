; DESCRIPTION: Renders a black line between points (91, 64) and (243, 3).
; PLAN: r0=91(x1), r1=64(y1), r2=243(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 64
LDI r2, 243
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
