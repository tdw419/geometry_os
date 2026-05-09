; DESCRIPTION: Renders a orange box of size 109x61 starting at (49, 168).
; PLAN: r0=49(x), r1=168(y), r2=109(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 168
LDI r2, 109
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
