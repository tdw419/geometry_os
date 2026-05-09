; DESCRIPTION: Renders a orange box of size 78x10 starting at (206, 32).
; PLAN: r0=206(x), r1=32(y), r2=78(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 32
LDI r2, 78
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
