; DESCRIPTION: Renders a orange box of size 10x16 starting at (182, 183).
; PLAN: r0=182(x), r1=183(y), r2=10(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 183
LDI r2, 10
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
