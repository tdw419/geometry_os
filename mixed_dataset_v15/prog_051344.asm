; DESCRIPTION: Places a white 84x108 box at position (325, 72).
; PLAN: r0=325(x), r1=72(y), r2=84(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 72
LDI r2, 84
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
