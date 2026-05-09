; DESCRIPTION: Places a orange 50x67 rectangle at position (234, 33).
; PLAN: r0=234(x), r1=33(y), r2=50(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 33
LDI r2, 50
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
