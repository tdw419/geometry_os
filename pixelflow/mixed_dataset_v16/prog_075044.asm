; DESCRIPTION: Composite: Renders a green disk with center (294, 157) and radius 51 then Draws a blue rectangle at (218, 133) with width 55 and height 110.
; PLAN: r0=294(x), r1=157(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=133(y), r7=55(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 157
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 133
LDI r7, 55
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
