; DESCRIPTION: Renders a black line between points (75, 28) and (187, 39).
; PLAN: r0=75(x1), r1=28(y1), r2=187(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 28
LDI r2, 187
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
