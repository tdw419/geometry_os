; DESCRIPTION: Places a white 34x107 rectangle at position (244, 34).
; PLAN: r0=244(x), r1=34(y), r2=34(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 34
LDI r2, 34
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
