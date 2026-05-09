; DESCRIPTION: Places a white 85x57 rectangle at position (134, 178).
; PLAN: r0=134(x), r1=178(y), r2=85(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 178
LDI r2, 85
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
