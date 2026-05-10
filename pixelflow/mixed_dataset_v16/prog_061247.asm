; DESCRIPTION: Creates a white filled rectangle of size 117x78 starting at (344, 12).
; PLAN: r0=344(x), r1=12(y), r2=117(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 12
LDI r2, 117
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
