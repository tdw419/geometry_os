; DESCRIPTION: Renders a red box of size 42x63 starting at (9, 116).
; PLAN: r0=9(x), r1=116(y), r2=42(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 116
LDI r2, 42
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
