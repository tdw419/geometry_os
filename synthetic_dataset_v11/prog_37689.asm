; DESCRIPTION: Renders a green line between points (214, 86) and (182, 7).
; PLAN: r0=214(x1), r1=86(y1), r2=182(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 86
LDI r2, 182
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
