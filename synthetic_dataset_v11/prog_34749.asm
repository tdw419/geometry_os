; DESCRIPTION: Renders a orange box of size 106x53 starting at (125, 42).
; PLAN: r0=125(x), r1=42(y), r2=106(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 42
LDI r2, 106
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
