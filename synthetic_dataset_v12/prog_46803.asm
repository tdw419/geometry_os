; DESCRIPTION: Renders a black line between points (178, 11) and (307, 3).
; PLAN: r0=178(x1), r1=11(y1), r2=307(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 11
LDI r2, 307
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
