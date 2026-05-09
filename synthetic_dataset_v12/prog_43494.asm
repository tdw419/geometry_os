; DESCRIPTION: Renders a cyan line between points (129, 123) and (407, 53).
; PLAN: r0=129(x1), r1=123(y1), r2=407(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 123
LDI r2, 407
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
