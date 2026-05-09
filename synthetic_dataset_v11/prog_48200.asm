; DESCRIPTION: Places a white 76x33 rectangle at position (35, 66).
; PLAN: r0=35(x), r1=66(y), r2=76(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 66
LDI r2, 76
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
