; DESCRIPTION: Places a orange 117x31 rectangle at position (94, 28).
; PLAN: r0=94(x), r1=28(y), r2=117(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 28
LDI r2, 117
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
