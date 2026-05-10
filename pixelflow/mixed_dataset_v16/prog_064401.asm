; DESCRIPTION: Renders a green line between points (223, 177) and (148, 16).
; PLAN: r0=223(x1), r1=177(y1), r2=148(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 177
LDI r2, 148
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
