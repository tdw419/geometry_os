; DESCRIPTION: Renders a orange box of size 32x17 starting at (214, 78).
; PLAN: r0=214(x), r1=78(y), r2=32(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 78
LDI r2, 32
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
