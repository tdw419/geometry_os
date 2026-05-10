; DESCRIPTION: Renders a white line between points (236, 193) and (148, 73).
; PLAN: r0=236(x1), r1=193(y1), r2=148(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 193
LDI r2, 148
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
