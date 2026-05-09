; DESCRIPTION: Places a white 89x60 rectangle at position (213, 43).
; PLAN: r0=213(x), r1=43(y), r2=89(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 43
LDI r2, 89
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
