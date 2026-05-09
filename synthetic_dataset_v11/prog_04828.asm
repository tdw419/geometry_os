; DESCRIPTION: Renders a red box of size 16x65 starting at (76, 165).
; PLAN: r0=76(x), r1=165(y), r2=16(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 165
LDI r2, 16
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
