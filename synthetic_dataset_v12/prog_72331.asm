; DESCRIPTION: Renders a yellow line between points (384, 213) and (24, 165).
; PLAN: r0=384(x1), r1=213(y1), r2=24(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 213
LDI r2, 24
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
