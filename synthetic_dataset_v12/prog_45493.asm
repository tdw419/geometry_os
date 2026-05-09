; DESCRIPTION: Places a white 20x105 rectangle at position (163, 108).
; PLAN: r0=163(x), r1=108(y), r2=20(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 108
LDI r2, 20
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
