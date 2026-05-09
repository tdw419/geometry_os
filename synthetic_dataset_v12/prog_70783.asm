; DESCRIPTION: Renders a black box of size 72x113 starting at (239, 74).
; PLAN: r0=239(x), r1=74(y), r2=72(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 74
LDI r2, 72
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
