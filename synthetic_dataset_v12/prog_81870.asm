; DESCRIPTION: Composite: Renders a green disk with center (81, 120) and radius 63 then Draws a purple line from (237, 139) to (410, 151) then Draws a magenta rectangle at (410, 180) with width 10 and height 23.
; PLAN: r0=81(x), r1=120(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=139(y1), r7=410(x2), r8=151(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=180(y), r12=10(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 120
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 139
LDI r7, 410
LDI r8, 151
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 180
LDI r12, 10
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
