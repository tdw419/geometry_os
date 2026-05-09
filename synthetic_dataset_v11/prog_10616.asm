; DESCRIPTION: Places a blue 78x18 rectangle at position (55, 125).
; PLAN: r0=55(x), r1=125(y), r2=78(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 125
LDI r2, 78
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
