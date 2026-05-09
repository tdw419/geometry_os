; DESCRIPTION: Renders a cyan line between points (151, 156) and (226, 221).
; PLAN: r0=151(x1), r1=156(y1), r2=226(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 156
LDI r2, 226
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
