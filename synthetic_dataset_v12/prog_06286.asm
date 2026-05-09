; DESCRIPTION: Composite: Renders a orange disk with center (121, 205) and radius 42 then Draws a blue rectangle at (72, 138) with width 16 and height 81.
; PLAN: r0=121(x), r1=205(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=138(y), r7=16(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 205
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 138
LDI r7, 16
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
