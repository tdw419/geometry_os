; DESCRIPTION: Places a orange 32x17 rectangle at position (117, 212).
; PLAN: r0=117(x), r1=212(y), r2=32(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 212
LDI r2, 32
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
