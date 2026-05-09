; DESCRIPTION: Composite: Draws a blue rectangle at (188, 16) with width 101 and height 71 then Places a black line segment connecting (327, 163) to (305, 5).
; PLAN: r0=188(x), r1=16(y), r2=101(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x1), r6=163(y1), r7=305(x2), r8=5(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 16
LDI r2, 101
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 163
LDI r7, 305
LDI r8, 5
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
