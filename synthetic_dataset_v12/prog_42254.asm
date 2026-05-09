; DESCRIPTION: Places a orange 50x69 rectangle at position (75, 35).
; PLAN: r0=75(x), r1=35(y), r2=50(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 35
LDI r2, 50
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
