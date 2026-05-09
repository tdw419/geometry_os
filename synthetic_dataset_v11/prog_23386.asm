; DESCRIPTION: Renders a orange box of size 42x108 starting at (115, 16).
; PLAN: r0=115(x), r1=16(y), r2=42(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 16
LDI r2, 42
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
