; DESCRIPTION: Places a orange 13x117 rectangle at position (129, 98).
; PLAN: r0=129(x), r1=98(y), r2=13(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 98
LDI r2, 13
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
