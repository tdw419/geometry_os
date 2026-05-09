; DESCRIPTION: Composite: Renders a black box of size 41x71 starting at (91, 39) then Renders a magenta disk with center (384, 153) and radius 30.
; PLAN: r0=91(x), r1=39(y), r2=41(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=153(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 39
LDI r2, 41
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 153
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
