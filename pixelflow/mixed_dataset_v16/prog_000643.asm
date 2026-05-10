; DESCRIPTION: Composite: Places a magenta 103x93 rectangle at position (25, 1) then Draws a blue circle centered at (387, 108) with radius 79.
; PLAN: r0=25(x), r1=1(y), r2=103(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=108(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 25
LDI r1, 1
LDI r2, 103
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 108
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
