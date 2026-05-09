; DESCRIPTION: Renders a cyan line between points (165, 202) and (359, 158).
; PLAN: r0=165(x1), r1=202(y1), r2=359(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 202
LDI r2, 359
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
