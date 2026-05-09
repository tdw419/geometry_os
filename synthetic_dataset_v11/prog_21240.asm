; DESCRIPTION: Places a orange 34x25 rectangle at position (117, 206).
; PLAN: r0=117(x), r1=206(y), r2=34(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 206
LDI r2, 34
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
