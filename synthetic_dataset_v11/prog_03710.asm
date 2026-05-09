; DESCRIPTION: Renders a orange box of size 102x39 starting at (60, 64).
; PLAN: r0=60(x), r1=64(y), r2=102(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 64
LDI r2, 102
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
