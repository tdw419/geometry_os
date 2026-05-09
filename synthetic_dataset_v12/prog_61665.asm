; DESCRIPTION: Renders a cyan line between points (384, 115) and (212, 129).
; PLAN: r0=384(x1), r1=115(y1), r2=212(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 115
LDI r2, 212
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
