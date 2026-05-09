; DESCRIPTION: Renders a orange box of size 62x57 starting at (38, 126).
; PLAN: r0=38(x), r1=126(y), r2=62(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 126
LDI r2, 62
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
