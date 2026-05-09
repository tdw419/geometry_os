; DESCRIPTION: Places a white 70x97 rectangle at position (310, 136).
; PLAN: r0=310(x), r1=136(y), r2=70(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 136
LDI r2, 70
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
