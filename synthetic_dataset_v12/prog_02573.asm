; DESCRIPTION: Composite: Sets a single white pixel at (469, 110) then Renders a green disk with center (307, 165) and radius 43 then Renders a red box of size 30x114 starting at (281, 27).
; PLAN: r0=469(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=165(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=27(y), r12=30(width), r13=114(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 165
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 27
LDI r12, 30
LDI r13, 114
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
