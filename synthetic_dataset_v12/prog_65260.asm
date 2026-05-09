; DESCRIPTION: Renders a red box of size 60x54 starting at (134, 12).
; PLAN: r0=134(x), r1=12(y), r2=60(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 12
LDI r2, 60
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
