; DESCRIPTION: Composite: . Then Renders a yellow box of size 83x97 starting at (153, 17). Then Renders a blue line between points (138, 62) and (101, 11).
; PLAN: r0=153(x), r1=17(y), r2=83(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=138(x1), r1=62(y1), r2=101(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 83x97 starting at (153, 17).
; PLAN: r0=153(x), r1=17(y), r2=83(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 17
LDI r2, 83
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (138, 62) and (101, 11).
; PLAN: r0=138(x1), r1=62(y1), r2=101(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 62
LDI r2, 101
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
