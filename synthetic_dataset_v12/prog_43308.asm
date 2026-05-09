; DESCRIPTION: Places a white 35x63 rectangle at position (419, 155).
; PLAN: r0=419(x), r1=155(y), r2=35(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 155
LDI r2, 35
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
