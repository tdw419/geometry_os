; DESCRIPTION: Composite: Places a yellow dot at position (479, 122) then Draws a black rectangle at (45, 160) with width 71 and height 80 then Places a white circle of radius 13 at center (286, 152).
; PLAN: r0=479(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=160(y), r7=71(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x), r11=152(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 479
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 45
LDI r6, 160
LDI r7, 71
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 152
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
