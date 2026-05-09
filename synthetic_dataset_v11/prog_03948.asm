; DESCRIPTION: Renders a magenta line between points (250, 221) and (241, 24).
; PLAN: r0=250(x1), r1=221(y1), r2=241(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 221
LDI r2, 241
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
