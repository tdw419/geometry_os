; DESCRIPTION: Renders a yellow line between points (236, 238) and (37, 125).
; PLAN: r0=236(x1), r1=238(y1), r2=37(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 238
LDI r2, 37
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
