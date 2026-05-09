; DESCRIPTION: Places a orange 69x109 rectangle at position (316, 2).
; PLAN: r0=316(x), r1=2(y), r2=69(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 2
LDI r2, 69
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
