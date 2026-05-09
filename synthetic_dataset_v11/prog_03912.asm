; DESCRIPTION: Places a orange 58x51 rectangle at position (76, 183).
; PLAN: r0=76(x), r1=183(y), r2=58(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 183
LDI r2, 58
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
