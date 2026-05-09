; DESCRIPTION: Renders a green line between points (434, 238) and (268, 245).
; PLAN: r0=434(x1), r1=238(y1), r2=268(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 238
LDI r2, 268
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
