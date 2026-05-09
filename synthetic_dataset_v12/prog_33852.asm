; DESCRIPTION: Composite: Renders a white line between points (190, 237) and (373, 7) then Draws a yellow rectangle at (93, 206) with width 46 and height 31.
; PLAN: r0=190(x1), r1=237(y1), r2=373(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=206(y), r7=46(width), r8=31(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 237
LDI r2, 373
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 206
LDI r7, 46
LDI r8, 31
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
