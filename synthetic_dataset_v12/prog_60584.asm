; DESCRIPTION: Composite: Sets a single yellow pixel at (271, 164) then Draws a green rectangle at (107, 168) with width 113 and height 57 then Draws a black circle centered at (365, 69) with radius 49.
; PLAN: r0=271(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=168(y), r7=113(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=69(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 107
LDI r6, 168
LDI r7, 113
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 69
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
