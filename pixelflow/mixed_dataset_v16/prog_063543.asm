; DESCRIPTION: Renders a white line between points (384, 240) and (157, 44).
; PLAN: r0=384(x1), r1=240(y1), r2=157(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 240
LDI r2, 157
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
