; DESCRIPTION: Renders a red box of size 114x94 starting at (247, 19).
; PLAN: r0=247(x), r1=19(y), r2=114(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 19
LDI r2, 114
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
