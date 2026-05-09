; DESCRIPTION: Places a orange 70x107 rectangle at position (29, 99).
; PLAN: r0=29(x), r1=99(y), r2=70(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 99
LDI r2, 70
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
