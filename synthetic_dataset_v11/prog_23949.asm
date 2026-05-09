; DESCRIPTION: Renders a red box of size 88x98 starting at (154, 32).
; PLAN: r0=154(x), r1=32(y), r2=88(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 32
LDI r2, 88
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
