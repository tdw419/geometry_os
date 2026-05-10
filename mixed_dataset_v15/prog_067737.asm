; DESCRIPTION: Composite: Draws a yellow rectangle at (164, 210) with width 10 and height 27 then Renders a magenta line between points (377, 16) and (434, 94) then Renders a red disk with center (80, 116) and radius 72.
; PLAN: r0=164(x), r1=210(y), r2=10(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x1), r6=16(y1), r7=434(x2), r8=94(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=116(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 210
LDI r2, 10
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 16
LDI r7, 434
LDI r8, 94
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 116
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
