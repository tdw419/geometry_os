; DESCRIPTION: Places a orange 104x60 rectangle at position (310, 26).
; PLAN: r0=310(x), r1=26(y), r2=104(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 26
LDI r2, 104
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
