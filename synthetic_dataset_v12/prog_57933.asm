; DESCRIPTION: Renders a blue box of size 73x38 starting at (291, 36).
; PLAN: r0=291(x), r1=36(y), r2=73(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 36
LDI r2, 73
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
