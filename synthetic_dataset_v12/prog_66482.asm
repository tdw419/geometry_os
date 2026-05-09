; DESCRIPTION: Renders a yellow line between points (104, 86) and (421, 117).
; PLAN: r0=104(x1), r1=86(y1), r2=421(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 86
LDI r2, 421
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
