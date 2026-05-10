; DESCRIPTION: Places a orange 69x50 rectangle at position (244, 20).
; PLAN: r0=244(x), r1=20(y), r2=69(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 20
LDI r2, 69
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
