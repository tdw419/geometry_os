; DESCRIPTION: Places a orange 58x105 rectangle at position (370, 12).
; PLAN: r0=370(x), r1=12(y), r2=58(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 12
LDI r2, 58
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
