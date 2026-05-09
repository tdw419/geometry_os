; DESCRIPTION: Composite: Renders a black disk with center (435, 67) and radius 23 then Renders a green line between points (327, 142) and (81, 88).
; PLAN: r0=435(x), r1=67(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x1), r6=142(y1), r7=81(x2), r8=88(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 67
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 142
LDI r7, 81
LDI r8, 88
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
