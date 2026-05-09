; DESCRIPTION: Renders a black line between points (48, 96) and (66, 19).
; PLAN: r0=48(x1), r1=96(y1), r2=66(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 96
LDI r2, 66
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
