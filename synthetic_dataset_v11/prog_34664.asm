; DESCRIPTION: Renders a cyan line between points (0, 76) and (11, 156).
; PLAN: r0=0(x1), r1=76(y1), r2=11(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 76
LDI r2, 11
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
