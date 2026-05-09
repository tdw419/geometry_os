; DESCRIPTION: Places a orange 118x22 rectangle at position (295, 176).
; PLAN: r0=295(x), r1=176(y), r2=118(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 176
LDI r2, 118
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
