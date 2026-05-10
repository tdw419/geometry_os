; DESCRIPTION: Renders a red box of size 62x115 starting at (13, 135).
; PLAN: r0=13(x), r1=135(y), r2=62(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 135
LDI r2, 62
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
