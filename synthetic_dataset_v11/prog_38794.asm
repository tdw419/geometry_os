; DESCRIPTION: Renders a green line between points (167, 66) and (212, 234).
; PLAN: r0=167(x1), r1=66(y1), r2=212(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 66
LDI r2, 212
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
