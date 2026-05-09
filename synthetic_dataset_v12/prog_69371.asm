; DESCRIPTION: Places a red 34x20 rectangle at position (78, 137).
; PLAN: r0=78(x), r1=137(y), r2=34(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 137
LDI r2, 34
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
