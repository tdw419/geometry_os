; DESCRIPTION: Composite: Sets a single black pixel at (20, 255) then Draws a orange rectangle at (356, 124) with width 29 and height 29 then Renders a blue disk with center (203, 27) and radius 10.
; PLAN: r0=20(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=124(y), r7=29(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x), r11=27(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 356
LDI r6, 124
LDI r7, 29
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 27
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
