; DESCRIPTION: Renders a black box of size 10x113 starting at (375, 92).
; PLAN: r0=375(x), r1=92(y), r2=10(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 92
LDI r2, 10
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
