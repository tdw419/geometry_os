; DESCRIPTION: Renders a red box of size 21x69 starting at (140, 15).
; PLAN: r0=140(x), r1=15(y), r2=21(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 15
LDI r2, 21
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
