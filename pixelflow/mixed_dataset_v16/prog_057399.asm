; DESCRIPTION: Composite: Places a cyan 108x75 rectangle at position (203, 90) then Draws a yellow circle centered at (320, 116) with radius 25 then Places a cyan dot at position (423, 144).
; PLAN: r0=203(x), r1=90(y), r2=108(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=116(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=144(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 90
LDI r2, 108
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 116
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 144
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
