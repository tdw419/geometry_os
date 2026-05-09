; DESCRIPTION: Renders a red box of size 32x63 starting at (330, 130).
; PLAN: r0=330(x), r1=130(y), r2=32(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 130
LDI r2, 32
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
