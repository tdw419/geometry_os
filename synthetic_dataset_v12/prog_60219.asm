; DESCRIPTION: Places a orange 110x19 rectangle at position (232, 187).
; PLAN: r0=232(x), r1=187(y), r2=110(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 187
LDI r2, 110
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
