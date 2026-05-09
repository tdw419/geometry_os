; DESCRIPTION: Composite: . Then Renders a black disk with center (130, 137) and radius 67. Then Renders a black box of size 73x72 starting at (154, 173).
; PLAN: r0=130(x), r1=137(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=154(x), r1=173(y), r2=73(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (130, 137) and radius 67.
; PLAN: r0=130(x), r1=137(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 137
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black box of size 73x72 starting at (154, 173).
; PLAN: r0=154(x), r1=173(y), r2=73(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 173
LDI r2, 73
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
