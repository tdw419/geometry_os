; DESCRIPTION: Renders a white line between points (97, 213) and (385, 102).
; PLAN: r0=97(x1), r1=213(y1), r2=385(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 213
LDI r2, 385
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
