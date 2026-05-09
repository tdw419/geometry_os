; DESCRIPTION: Composite: Places a cyan circle of radius 55 at center (314, 111) then Places a magenta dot at position (5, 167) then Places a red 88x24 rectangle at position (35, 39).
; PLAN: r0=314(x), r1=111(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=167(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=35(x), r11=39(y), r12=88(width), r13=24(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 111
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 167
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 35
LDI r11, 39
LDI r12, 88
LDI r13, 24
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
