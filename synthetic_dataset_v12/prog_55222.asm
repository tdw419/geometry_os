; DESCRIPTION: Renders a green line between points (74, 62) and (3, 202).
; PLAN: r0=74(x1), r1=62(y1), r2=3(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 62
LDI r2, 3
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
