; DESCRIPTION: Places a orange 117x62 rectangle at position (370, 155).
; PLAN: r0=370(x), r1=155(y), r2=117(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 155
LDI r2, 117
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
