; DESCRIPTION: Renders a green line between points (426, 113) and (406, 136).
; PLAN: r0=426(x1), r1=113(y1), r2=406(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 113
LDI r2, 406
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
