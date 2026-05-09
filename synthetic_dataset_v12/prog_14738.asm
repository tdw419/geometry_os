; DESCRIPTION: Renders a red box of size 42x39 starting at (85, 131).
; PLAN: r0=85(x), r1=131(y), r2=42(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 131
LDI r2, 42
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
