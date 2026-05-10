; DESCRIPTION: Renders a blue line between points (289, 242) and (333, 55).
; PLAN: r0=289(x1), r1=242(y1), r2=333(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 242
LDI r2, 333
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
