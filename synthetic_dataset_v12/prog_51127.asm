; DESCRIPTION: Composite: Renders a yellow disk with center (423, 109) and radius 74 then Renders a yellow line between points (33, 53) and (127, 73).
; PLAN: r0=423(x), r1=109(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x1), r6=53(y1), r7=127(x2), r8=73(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 109
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 53
LDI r7, 127
LDI r8, 73
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
