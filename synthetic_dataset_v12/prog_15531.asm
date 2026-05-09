; DESCRIPTION: Renders a cyan line between points (259, 240) and (119, 156).
; PLAN: r0=259(x1), r1=240(y1), r2=119(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 240
LDI r2, 119
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
