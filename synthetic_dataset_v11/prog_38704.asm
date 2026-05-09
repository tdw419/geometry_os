; DESCRIPTION: Renders a red box of size 27x108 starting at (50, 43).
; PLAN: r0=50(x), r1=43(y), r2=27(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 43
LDI r2, 27
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
