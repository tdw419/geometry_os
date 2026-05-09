; DESCRIPTION: Renders a black box of size 28x18 starting at (332, 215).
; PLAN: r0=332(x), r1=215(y), r2=28(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 215
LDI r2, 28
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
