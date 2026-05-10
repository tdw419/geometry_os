; DESCRIPTION: Renders a green line between points (373, 73) and (213, 90).
; PLAN: r0=373(x1), r1=73(y1), r2=213(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 73
LDI r2, 213
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
