; DESCRIPTION: Places a white 84x31 rectangle at position (281, 191).
; PLAN: r0=281(x), r1=191(y), r2=84(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 191
LDI r2, 84
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
