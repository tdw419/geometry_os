; DESCRIPTION: Renders a red box of size 15x42 starting at (377, 13).
; PLAN: r0=377(x), r1=13(y), r2=15(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 13
LDI r2, 15
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
