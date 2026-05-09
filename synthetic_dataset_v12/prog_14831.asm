; DESCRIPTION: Composite: Renders a magenta box of size 18x73 starting at (230, 60) then Draws a purple circle centered at (67, 209) with radius 44 then Places a cyan dot at position (384, 18).
; PLAN: r0=230(x), r1=60(y), r2=18(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=209(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=18(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 60
LDI r2, 18
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 209
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 18
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
