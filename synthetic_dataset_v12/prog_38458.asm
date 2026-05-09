; DESCRIPTION: Renders a yellow line between points (406, 22) and (384, 37).
; PLAN: r0=406(x1), r1=22(y1), r2=384(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 22
LDI r2, 384
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
