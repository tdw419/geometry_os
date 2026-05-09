; DESCRIPTION: Renders a cyan line between points (223, 137) and (76, 92).
; PLAN: r0=223(x1), r1=137(y1), r2=76(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 137
LDI r2, 76
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
