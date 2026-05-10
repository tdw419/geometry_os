; DESCRIPTION: Places a white 31x45 box at position (299, 125).
; PLAN: r0=299(x), r1=125(y), r2=31(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 125
LDI r2, 31
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
