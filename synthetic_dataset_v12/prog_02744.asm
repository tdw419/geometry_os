; DESCRIPTION: Renders a cyan line between points (56, 86) and (189, 4).
; PLAN: r0=56(x1), r1=86(y1), r2=189(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 86
LDI r2, 189
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
