; DESCRIPTION: Composite: Places a cyan 28x10 rectangle at position (153, 127) then Draws a orange circle centered at (161, 198) with radius 19.
; PLAN: r0=153(x), r1=127(y), r2=28(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=198(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 127
LDI r2, 28
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 198
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
