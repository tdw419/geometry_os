; DESCRIPTION: Places a white 114x13 rectangle at position (280, 76).
; PLAN: r0=280(x), r1=76(y), r2=114(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 76
LDI r2, 114
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
