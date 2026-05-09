; DESCRIPTION: Renders a red box of size 64x108 starting at (130, 148).
; PLAN: r0=130(x), r1=148(y), r2=64(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 148
LDI r2, 64
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
