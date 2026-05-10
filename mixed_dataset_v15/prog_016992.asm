; DESCRIPTION: Places a orange 107x56 rectangle at position (316, 193).
; PLAN: r0=316(x), r1=193(y), r2=107(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 193
LDI r2, 107
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
