; DESCRIPTION: Composite: Places a yellow dot at position (113, 0) then Draws a purple circle centered at (38, 160) with radius 18 then Places a cyan 69x64 rectangle at position (4, 46).
; PLAN: r0=113(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=160(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=46(y), r12=69(width), r13=64(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 38
LDI r6, 160
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 46
LDI r12, 69
LDI r13, 64
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
