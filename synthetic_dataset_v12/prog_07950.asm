; DESCRIPTION: Renders a orange box of size 52x84 starting at (241, 32).
; PLAN: r0=241(x), r1=32(y), r2=52(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 32
LDI r2, 52
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
