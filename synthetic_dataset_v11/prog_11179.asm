; DESCRIPTION: Renders a orange box of size 74x31 starting at (50, 14).
; PLAN: r0=50(x), r1=14(y), r2=74(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 14
LDI r2, 74
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
