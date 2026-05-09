; DESCRIPTION: Renders a black line between points (171, 242) and (466, 1).
; PLAN: r0=171(x1), r1=242(y1), r2=466(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 242
LDI r2, 466
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
