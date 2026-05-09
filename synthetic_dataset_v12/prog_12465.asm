; DESCRIPTION: Composite: Draws a white circle centered at (225, 155) with radius 44 then Draws a white rectangle at (433, 95) with width 79 and height 67 then Sets a single magenta pixel at (180, 32).
; PLAN: r0=225(x), r1=155(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=95(y), r7=79(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x), r11=32(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 155
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 95
LDI r7, 79
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 32
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
