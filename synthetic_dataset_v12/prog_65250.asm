; DESCRIPTION: Composite: Places a yellow 37x25 rectangle at position (314, 142) then Renders a yellow line between points (167, 20) and (500, 58).
; PLAN: r0=314(x), r1=142(y), r2=37(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=20(y1), r7=500(x2), r8=58(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 142
LDI r2, 37
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 20
LDI r7, 500
LDI r8, 58
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
