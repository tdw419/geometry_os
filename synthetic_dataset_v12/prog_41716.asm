; DESCRIPTION: Places a blue 23x103 rectangle at position (339, 77).
; PLAN: r0=339(x), r1=77(y), r2=23(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 77
LDI r2, 23
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
