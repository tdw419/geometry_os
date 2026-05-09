; DESCRIPTION: Renders a orange box of size 106x24 starting at (343, 32).
; PLAN: r0=343(x), r1=32(y), r2=106(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 32
LDI r2, 106
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
