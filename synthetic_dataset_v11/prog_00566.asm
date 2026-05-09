; DESCRIPTION: Renders a cyan line between points (61, 113) and (99, 241).
; PLAN: r0=61(x1), r1=113(y1), r2=99(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 113
LDI r2, 99
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
