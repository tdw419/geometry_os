; DESCRIPTION: Composite: Renders a orange box of size 114x47 starting at (384, 135) then Sets a single purple pixel at (329, 19) then Places a red circle of radius 24 at center (237, 202).
; PLAN: r0=384(x), r1=135(y), r2=114(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=19(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=237(x), r11=202(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 135
LDI r2, 114
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 19
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 237
LDI r11, 202
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
