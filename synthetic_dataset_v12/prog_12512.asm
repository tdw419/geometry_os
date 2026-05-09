; DESCRIPTION: Renders a red box of size 114x120 starting at (291, 117).
; PLAN: r0=291(x), r1=117(y), r2=114(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 117
LDI r2, 114
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
