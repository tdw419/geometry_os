; DESCRIPTION: Renders a cyan line between points (19, 177) and (223, 156).
; PLAN: r0=19(x1), r1=177(y1), r2=223(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 177
LDI r2, 223
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
