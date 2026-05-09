; DESCRIPTION: Places a orange 69x42 rectangle at position (50, 34).
; PLAN: r0=50(x), r1=34(y), r2=69(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 34
LDI r2, 69
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
