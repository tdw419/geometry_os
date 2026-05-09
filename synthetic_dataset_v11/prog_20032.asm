; DESCRIPTION: Places a blue 78x113 rectangle at position (37, 123).
; PLAN: r0=37(x), r1=123(y), r2=78(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 123
LDI r2, 78
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
