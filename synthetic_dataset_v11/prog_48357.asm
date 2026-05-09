; DESCRIPTION: Renders a orange box of size 63x49 starting at (53, 29).
; PLAN: r0=53(x), r1=29(y), r2=63(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 29
LDI r2, 63
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
