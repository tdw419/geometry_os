; DESCRIPTION: Places a orange 59x99 rectangle at position (344, 70).
; PLAN: r0=344(x), r1=70(y), r2=59(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 70
LDI r2, 59
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
