; DESCRIPTION: Composite: Sets a single magenta pixel at (479, 25) then Draws a blue rectangle at (356, 67) with width 12 and height 47 then Creates a black circular shape at (437, 161) with radius 33.
; PLAN: r0=479(x), r1=25(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=67(y), r7=12(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=437(x), r11=161(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 479
LDI r1, 25
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 67
LDI r7, 12
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 161
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
