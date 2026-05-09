; DESCRIPTION: Renders a red box of size 17x13 starting at (65, 42).
; PLAN: r0=65(x), r1=42(y), r2=17(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 42
LDI r2, 17
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
