; DESCRIPTION: Composite: Places a blue 113x69 rectangle at position (60, 58) then Sets a single cyan pixel at (324, 138) then Draws a black circle centered at (103, 166) with radius 77.
; PLAN: r0=60(x), r1=58(y), r2=113(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=138(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=166(y), r12=77(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 58
LDI r2, 113
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 138
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 166
LDI r12, 77
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
