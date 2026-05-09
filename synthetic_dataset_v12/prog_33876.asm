; DESCRIPTION: Places a orange 16x14 rectangle at position (189, 191).
; PLAN: r0=189(x), r1=191(y), r2=16(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 191
LDI r2, 16
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
