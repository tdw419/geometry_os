; DESCRIPTION: Places a white 105x13 rectangle at position (275, 216).
; PLAN: r0=275(x), r1=216(y), r2=105(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 216
LDI r2, 105
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
