; DESCRIPTION: Renders a black line between points (492, 178) and (27, 20).
; PLAN: r0=492(x1), r1=178(y1), r2=27(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 178
LDI r2, 27
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
