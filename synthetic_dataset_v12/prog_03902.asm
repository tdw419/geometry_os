; DESCRIPTION: Renders a orange box of size 100x42 starting at (100, 198).
; PLAN: r0=100(x), r1=198(y), r2=100(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 198
LDI r2, 100
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
