; DESCRIPTION: Places a white 30x97 rectangle at position (90, 145).
; PLAN: r0=90(x), r1=145(y), r2=30(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 145
LDI r2, 30
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
