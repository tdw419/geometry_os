; DESCRIPTION: Renders a cyan line between points (460, 145) and (128, 129).
; PLAN: r0=460(x1), r1=145(y1), r2=128(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 145
LDI r2, 128
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
