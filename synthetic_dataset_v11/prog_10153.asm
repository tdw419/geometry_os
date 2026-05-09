; DESCRIPTION: Renders a black box of size 70x12 starting at (114, 204).
; PLAN: r0=114(x), r1=204(y), r2=70(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 204
LDI r2, 70
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
