; DESCRIPTION: Composite: Renders a yellow line between points (59, 92) and (152, 100) then Draws a blue rectangle at (256, 60) with width 35 and height 57.
; PLAN: r0=59(x1), r1=92(y1), r2=152(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=60(y), r7=35(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 92
LDI r2, 152
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 60
LDI r7, 35
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
