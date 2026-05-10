; DESCRIPTION: Composite: Draws a red circle centered at (440, 79) with radius 59 then Draws a blue rectangle at (220, 6) with width 120 and height 93 then Sets a single white pixel at (304, 228).
; PLAN: r0=440(x), r1=79(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=6(y), r7=120(width), r8=93(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=228(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 79
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 6
LDI r7, 120
LDI r8, 93
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 228
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
