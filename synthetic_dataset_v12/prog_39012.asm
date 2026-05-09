; DESCRIPTION: Places a white 110x40 rectangle at position (329, 45).
; PLAN: r0=329(x), r1=45(y), r2=110(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 45
LDI r2, 110
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
