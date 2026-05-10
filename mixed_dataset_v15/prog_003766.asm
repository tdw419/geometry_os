; DESCRIPTION: Composite: Renders a cyan disk with center (399, 96) and radius 27 then Sets a single cyan pixel at (490, 168) then Draws a green rectangle at (408, 67) with width 23 and height 16.
; PLAN: r0=399(x), r1=96(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x), r6=168(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=67(y), r12=23(width), r13=16(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 96
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 168
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 408
LDI r11, 67
LDI r12, 23
LDI r13, 16
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
