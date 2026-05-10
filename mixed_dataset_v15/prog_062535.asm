; DESCRIPTION: Places a white 58x39 rectangle at position (338, 110).
; PLAN: r0=338(x), r1=110(y), r2=58(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 110
LDI r2, 58
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
