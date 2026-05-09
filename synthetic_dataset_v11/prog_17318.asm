; DESCRIPTION: Renders a orange box of size 110x64 starting at (53, 149).
; PLAN: r0=53(x), r1=149(y), r2=110(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 149
LDI r2, 110
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
