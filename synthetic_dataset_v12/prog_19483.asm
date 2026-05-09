; DESCRIPTION: Renders a red box of size 62x45 starting at (103, 181).
; PLAN: r0=103(x), r1=181(y), r2=62(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 181
LDI r2, 62
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
