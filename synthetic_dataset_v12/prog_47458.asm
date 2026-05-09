; DESCRIPTION: Places a orange 13x61 rectangle at position (328, 181).
; PLAN: r0=328(x), r1=181(y), r2=13(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 181
LDI r2, 13
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
