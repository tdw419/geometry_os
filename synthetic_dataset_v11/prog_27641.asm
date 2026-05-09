; DESCRIPTION: Renders a orange box of size 85x86 starting at (129, 62).
; PLAN: r0=129(x), r1=62(y), r2=85(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 62
LDI r2, 85
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
