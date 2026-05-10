; DESCRIPTION: Composite: Places a magenta circle of radius 35 at center (278, 204) then Sets a single green pixel at (356, 228) then Draws a cyan rectangle at (70, 0) with width 69 and height 42.
; PLAN: r0=278(x), r1=204(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=70(x), r11=0(y), r12=69(width), r13=42(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 204
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 70
LDI r11, 0
LDI r12, 69
LDI r13, 42
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
