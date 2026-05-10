; DESCRIPTION: Composite: Draws a yellow rectangle at (76, 86) with width 44 and height 47 then Renders a yellow line between points (363, 154) and (415, 0).
; PLAN: r0=76(x), r1=86(y), r2=44(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x1), r6=154(y1), r7=415(x2), r8=0(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 86
LDI r2, 44
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 154
LDI r7, 415
LDI r8, 0
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
