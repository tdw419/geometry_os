; DESCRIPTION: Renders a yellow line between points (128, 27) and (41, 221).
; PLAN: r0=128(x1), r1=27(y1), r2=41(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 27
LDI r2, 41
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
