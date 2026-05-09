; DESCRIPTION: Places a white 70x84 rectangle at position (219, 129).
; PLAN: r0=219(x), r1=129(y), r2=70(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 129
LDI r2, 70
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
