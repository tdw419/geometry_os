; DESCRIPTION: Renders a red box of size 108x12 starting at (191, 193).
; PLAN: r0=191(x), r1=193(y), r2=108(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 193
LDI r2, 108
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
