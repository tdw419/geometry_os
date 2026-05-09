; DESCRIPTION: Renders a black line between points (92, 225) and (176, 231).
; PLAN: r0=92(x1), r1=225(y1), r2=176(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 225
LDI r2, 176
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
