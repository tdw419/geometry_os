; DESCRIPTION: Composite: Draws a purple rectangle at (369, 16) with width 30 and height 10 then Places a yellow dot at position (434, 27) then Places a red line segment connecting (224, 114) to (92, 100).
; PLAN: r0=369(x), r1=16(y), r2=30(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=224(x1), r11=114(y1), r12=92(x2), r13=100(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 16
LDI r2, 30
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 224
LDI r11, 114
LDI r12, 92
LDI r13, 100
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
