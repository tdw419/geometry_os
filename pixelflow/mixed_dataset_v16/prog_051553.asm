; DESCRIPTION: Renders a black line between points (68, 39) and (367, 25).
; PLAN: r0=68(x1), r1=39(y1), r2=367(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 39
LDI r2, 367
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
