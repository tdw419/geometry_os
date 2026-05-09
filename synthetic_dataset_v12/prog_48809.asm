; DESCRIPTION: Renders a red box of size 75x76 starting at (396, 45).
; PLAN: r0=396(x), r1=45(y), r2=75(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 45
LDI r2, 75
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
