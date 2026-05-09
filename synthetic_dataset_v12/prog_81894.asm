; DESCRIPTION: Renders a green line between points (202, 122) and (416, 101).
; PLAN: r0=202(x1), r1=122(y1), r2=416(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 122
LDI r2, 416
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
