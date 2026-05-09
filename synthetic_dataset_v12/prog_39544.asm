; DESCRIPTION: Renders a red box of size 42x42 starting at (293, 1).
; PLAN: r0=293(x), r1=1(y), r2=42(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 1
LDI r2, 42
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
