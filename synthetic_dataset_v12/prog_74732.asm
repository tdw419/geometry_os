; DESCRIPTION: Composite: Renders a yellow box of size 120x62 starting at (375, 137) then Renders a blue line between points (189, 221) and (74, 155).
; PLAN: r0=375(x), r1=137(y), r2=120(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x1), r6=221(y1), r7=74(x2), r8=155(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 137
LDI r2, 120
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 221
LDI r7, 74
LDI r8, 155
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
