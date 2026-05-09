; DESCRIPTION: Places a white 71x78 rectangle at position (123, 105).
; PLAN: r0=123(x), r1=105(y), r2=71(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 105
LDI r2, 71
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
