; DESCRIPTION: Renders a black line between points (198, 195) and (92, 71).
; PLAN: r0=198(x1), r1=195(y1), r2=92(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 195
LDI r2, 92
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
