; DESCRIPTION: Renders a red box of size 43x50 starting at (90, 148).
; PLAN: r0=90(x), r1=148(y), r2=43(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 148
LDI r2, 43
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
