; DESCRIPTION: Renders a orange box of size 16x12 starting at (18, 206).
; PLAN: r0=18(x), r1=206(y), r2=16(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 206
LDI r2, 16
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
