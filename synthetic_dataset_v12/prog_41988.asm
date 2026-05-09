; DESCRIPTION: Composite: Draws a blue circle centered at (401, 141) with radius 48 then Renders a white box of size 60x102 starting at (304, 15) then Sets a single cyan pixel at (382, 151).
; PLAN: r0=401(x), r1=141(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=15(y), r7=60(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=151(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 141
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 15
LDI r7, 60
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 151
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
