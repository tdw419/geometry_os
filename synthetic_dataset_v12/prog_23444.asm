; DESCRIPTION: Places a orange 69x64 rectangle at position (353, 184).
; PLAN: r0=353(x), r1=184(y), r2=69(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 184
LDI r2, 69
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
