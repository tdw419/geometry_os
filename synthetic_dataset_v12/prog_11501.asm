; DESCRIPTION: Places a orange 94x69 rectangle at position (68, 82).
; PLAN: r0=68(x), r1=82(y), r2=94(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 82
LDI r2, 94
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
