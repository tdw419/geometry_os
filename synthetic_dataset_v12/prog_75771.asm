; DESCRIPTION: Renders a black line between points (445, 95) and (478, 187).
; PLAN: r0=445(x1), r1=95(y1), r2=478(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 95
LDI r2, 478
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
