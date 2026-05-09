; DESCRIPTION: Renders a blue line between points (458, 17) and (45, 215).
; PLAN: r0=458(x1), r1=17(y1), r2=45(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 17
LDI r2, 45
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
