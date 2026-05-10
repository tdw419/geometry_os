; DESCRIPTION: Places a orange 76x113 rectangle at position (361, 137).
; PLAN: r0=361(x), r1=137(y), r2=76(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 137
LDI r2, 76
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
