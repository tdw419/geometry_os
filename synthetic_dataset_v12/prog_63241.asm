; DESCRIPTION: Places a orange 13x105 rectangle at position (403, 116).
; PLAN: r0=403(x), r1=116(y), r2=13(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 116
LDI r2, 13
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
