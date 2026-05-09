; DESCRIPTION: Places a white 98x110 rectangle at position (122, 123).
; PLAN: r0=122(x), r1=123(y), r2=98(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 123
LDI r2, 98
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
