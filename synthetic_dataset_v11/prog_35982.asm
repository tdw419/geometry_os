; DESCRIPTION: Places a orange 58x16 rectangle at position (69, 138).
; PLAN: r0=69(x), r1=138(y), r2=58(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 138
LDI r2, 58
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
