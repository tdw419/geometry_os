; DESCRIPTION: Places a orange 69x55 rectangle at position (117, 79).
; PLAN: r0=117(x), r1=79(y), r2=69(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 79
LDI r2, 69
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
