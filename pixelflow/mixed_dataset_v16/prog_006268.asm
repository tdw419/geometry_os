; DESCRIPTION: Places a orange 50x49 rectangle at position (15, 148).
; PLAN: r0=15(x), r1=148(y), r2=50(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 148
LDI r2, 50
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
