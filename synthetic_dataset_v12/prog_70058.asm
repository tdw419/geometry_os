; DESCRIPTION: Renders a black box of size 20x113 starting at (491, 90).
; PLAN: r0=491(x), r1=90(y), r2=20(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 90
LDI r2, 20
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
