; DESCRIPTION: Renders a orange box of size 50x83 starting at (206, 67).
; PLAN: r0=206(x), r1=67(y), r2=50(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 67
LDI r2, 50
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
