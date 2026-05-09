; DESCRIPTION: Renders a black line between points (236, 148) and (380, 70).
; PLAN: r0=236(x1), r1=148(y1), r2=380(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 148
LDI r2, 380
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
