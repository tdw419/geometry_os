; DESCRIPTION: Renders a red box of size 118x22 starting at (310, 103).
; PLAN: r0=310(x), r1=103(y), r2=118(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 103
LDI r2, 118
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
