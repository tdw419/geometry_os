; DESCRIPTION: Places a orange 69x54 rectangle at position (26, 168).
; PLAN: r0=26(x), r1=168(y), r2=69(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 168
LDI r2, 69
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
