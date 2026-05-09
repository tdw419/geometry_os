; DESCRIPTION: Renders a orange box of size 32x10 starting at (13, 241).
; PLAN: r0=13(x), r1=241(y), r2=32(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 241
LDI r2, 32
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
