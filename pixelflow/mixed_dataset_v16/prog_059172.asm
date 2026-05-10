; DESCRIPTION: Composite: Creates a yellow rectangular region at (187, 160) spanning 75 by 37 pixels then Places a cyan dot at position (267, 124) then Draws a red circle centered at (69, 192) with radius 30.
; PLAN: r0=187(x), r1=160(y), r2=75(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=124(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=69(x), r11=192(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 160
LDI r2, 75
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 124
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 69
LDI r11, 192
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
