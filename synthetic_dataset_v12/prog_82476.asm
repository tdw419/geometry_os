; DESCRIPTION: Renders a black line between points (44, 243) and (501, 27).
; PLAN: r0=44(x1), r1=243(y1), r2=501(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 243
LDI r2, 501
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
