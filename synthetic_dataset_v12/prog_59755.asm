; DESCRIPTION: Renders a yellow line between points (167, 9) and (96, 128).
; PLAN: r0=167(x1), r1=9(y1), r2=96(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 9
LDI r2, 96
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
