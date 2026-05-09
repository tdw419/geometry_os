; DESCRIPTION: Composite: Draws a blue rectangle at (42, 120) with width 97 and height 109 then Draws a cyan circle centered at (415, 121) with radius 66 then Renders a red line between points (337, 139) and (160, 94).
; PLAN: r0=42(x), r1=120(y), r2=97(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=121(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=139(y1), r12=160(x2), r13=94(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 120
LDI r2, 97
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 121
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 139
LDI r12, 160
LDI r13, 94
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
