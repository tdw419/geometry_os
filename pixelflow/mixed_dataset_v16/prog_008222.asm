; DESCRIPTION: Renders a red box of size 99x42 starting at (100, 90).
; PLAN: r0=100(x), r1=90(y), r2=99(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 90
LDI r2, 99
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
