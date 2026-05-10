; DESCRIPTION: Places a white 118x21 rectangle at position (390, 135).
; PLAN: r0=390(x), r1=135(y), r2=118(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 135
LDI r2, 118
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
