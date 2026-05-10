; DESCRIPTION: Composite: Places a purple circle of radius 31 at center (36, 134) then Draws a yellow rectangle at (131, 86) with width 44 and height 34 then Renders a cyan line between points (202, 108) and (274, 134).
; PLAN: r0=36(x), r1=134(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=86(y), r7=44(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x1), r11=108(y1), r12=274(x2), r13=134(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 134
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 86
LDI r7, 44
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 108
LDI r12, 274
LDI r13, 134
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
