; DESCRIPTION: Renders a red box of size 32x24 starting at (420, 130).
; PLAN: r0=420(x), r1=130(y), r2=32(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 130
LDI r2, 32
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
