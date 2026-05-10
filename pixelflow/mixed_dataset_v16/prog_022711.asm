; DESCRIPTION: Renders a red box of size 62x90 starting at (15, 108).
; PLAN: r0=15(x), r1=108(y), r2=62(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 108
LDI r2, 62
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
