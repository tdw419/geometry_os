; DESCRIPTION: Draws a black rectangle at (401, 10) with width 86 and height 101.
; PLAN: r0=401(x), r1=10(y), r2=86(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 10
LDI r2, 86
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
