; DESCRIPTION: Renders a black box of size 19x120 starting at (291, 135).
; PLAN: r0=291(x), r1=135(y), r2=19(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 135
LDI r2, 19
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
