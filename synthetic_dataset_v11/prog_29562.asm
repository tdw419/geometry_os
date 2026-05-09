; DESCRIPTION: Renders a red box of size 11x24 starting at (224, 25).
; PLAN: r0=224(x), r1=25(y), r2=11(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 25
LDI r2, 11
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
