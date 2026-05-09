; DESCRIPTION: Renders a red box of size 18x14 starting at (421, 207).
; PLAN: r0=421(x), r1=207(y), r2=18(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 207
LDI r2, 18
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
