; DESCRIPTION: Renders a black box of size 94x92 starting at (291, 25).
; PLAN: r0=291(x), r1=25(y), r2=94(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 25
LDI r2, 94
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
