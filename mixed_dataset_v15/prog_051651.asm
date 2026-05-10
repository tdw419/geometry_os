; DESCRIPTION: Renders a cyan line between points (129, 120) and (299, 163).
; PLAN: r0=129(x1), r1=120(y1), r2=299(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 120
LDI r2, 299
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
