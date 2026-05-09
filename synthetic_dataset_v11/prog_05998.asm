; DESCRIPTION: Renders a green line between points (7, 24) and (59, 217).
; PLAN: r0=7(x1), r1=24(y1), r2=59(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 24
LDI r2, 59
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
