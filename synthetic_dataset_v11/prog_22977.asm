; DESCRIPTION: Renders a black box of size 86x28 starting at (104, 13).
; PLAN: r0=104(x), r1=13(y), r2=86(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 13
LDI r2, 86
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
