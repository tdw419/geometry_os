; DESCRIPTION: Renders a red line between points (187, 238) and (156, 63).
; PLAN: r0=187(x1), r1=238(y1), r2=156(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 238
LDI r2, 156
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
