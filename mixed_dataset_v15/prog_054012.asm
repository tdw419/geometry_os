; DESCRIPTION: Renders a cyan line between points (304, 198) and (506, 194).
; PLAN: r0=304(x1), r1=198(y1), r2=506(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 198
LDI r2, 506
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
