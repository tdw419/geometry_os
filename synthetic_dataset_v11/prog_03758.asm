; DESCRIPTION: Places a orange 69x98 rectangle at position (142, 133).
; PLAN: r0=142(x), r1=133(y), r2=69(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 133
LDI r2, 69
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
