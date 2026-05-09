; DESCRIPTION: Renders a red box of size 43x48 starting at (107, 184).
; PLAN: r0=107(x), r1=184(y), r2=43(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 184
LDI r2, 43
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
