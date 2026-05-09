; DESCRIPTION: Renders a red box of size 58x42 starting at (83, 42).
; PLAN: r0=83(x), r1=42(y), r2=58(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 42
LDI r2, 58
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
