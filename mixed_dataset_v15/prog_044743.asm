; DESCRIPTION: Composite: Renders a cyan disk with center (218, 116) and radius 46 then Draws a green rectangle at (480, 101) with width 22 and height 98 then Places a red dot at position (318, 0).
; PLAN: r0=218(x), r1=116(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x), r6=101(y), r7=22(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=318(x), r11=0(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 116
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 101
LDI r7, 22
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 0
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
