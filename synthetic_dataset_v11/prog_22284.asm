; DESCRIPTION: Renders a black box of size 49x17 starting at (63, 117).
; PLAN: r0=63(x), r1=117(y), r2=49(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 117
LDI r2, 49
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
