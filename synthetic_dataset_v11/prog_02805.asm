; DESCRIPTION: Renders a cyan line between points (58, 144) and (151, 109).
; PLAN: r0=58(x1), r1=144(y1), r2=151(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 144
LDI r2, 151
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
