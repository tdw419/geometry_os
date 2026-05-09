; DESCRIPTION: Renders a orange box of size 40x42 starting at (24, 149).
; PLAN: r0=24(x), r1=149(y), r2=40(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 149
LDI r2, 40
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
