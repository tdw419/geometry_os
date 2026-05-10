; DESCRIPTION: Places a orange 17x76 rectangle at position (72, 17).
; PLAN: r0=72(x), r1=17(y), r2=17(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 17
LDI r2, 17
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
