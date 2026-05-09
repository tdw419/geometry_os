; DESCRIPTION: Places a yellow 114x35 rectangle at position (344, 176).
; PLAN: r0=344(x), r1=176(y), r2=114(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 176
LDI r2, 114
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
