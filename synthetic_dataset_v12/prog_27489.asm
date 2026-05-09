; DESCRIPTION: Places a white 22x19 rectangle at position (344, 116).
; PLAN: r0=344(x), r1=116(y), r2=22(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 116
LDI r2, 22
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
