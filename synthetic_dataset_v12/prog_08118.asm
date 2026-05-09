; DESCRIPTION: Renders a red box of size 35x27 starting at (437, 42).
; PLAN: r0=437(x), r1=42(y), r2=35(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 42
LDI r2, 35
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
