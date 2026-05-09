; DESCRIPTION: Renders a orange box of size 32x75 starting at (4, 81).
; PLAN: r0=4(x), r1=81(y), r2=32(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 81
LDI r2, 32
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
