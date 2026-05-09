; DESCRIPTION: Places a white 34x62 rectangle at position (407, 80).
; PLAN: r0=407(x), r1=80(y), r2=34(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 80
LDI r2, 34
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
