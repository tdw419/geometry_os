; DESCRIPTION: Renders a magenta box of size 76x34 starting at (375, 14).
; PLAN: r0=375(x), r1=14(y), r2=76(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 14
LDI r2, 76
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
