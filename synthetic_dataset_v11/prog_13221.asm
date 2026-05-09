; DESCRIPTION: Renders a orange box of size 76x90 starting at (60, 74).
; PLAN: r0=60(x), r1=74(y), r2=76(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 74
LDI r2, 76
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
