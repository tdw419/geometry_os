; DESCRIPTION: Renders a cyan line between points (129, 80) and (265, 198).
; PLAN: r0=129(x1), r1=80(y1), r2=265(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 80
LDI r2, 265
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
