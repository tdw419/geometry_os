; DESCRIPTION: Places a orange 47x21 rectangle at position (94, 70).
; PLAN: r0=94(x), r1=70(y), r2=47(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 70
LDI r2, 47
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
