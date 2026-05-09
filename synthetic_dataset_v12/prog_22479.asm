; DESCRIPTION: Composite: Renders a yellow disk with center (178, 115) and radius 28 then Renders a black box of size 56x32 starting at (245, 67).
; PLAN: r0=178(x), r1=115(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=67(y), r7=56(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 115
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 67
LDI r7, 56
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
