; DESCRIPTION: Places a blue 89x105 rectangle at position (399, 33).
; PLAN: r0=399(x), r1=33(y), r2=89(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 33
LDI r2, 89
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
