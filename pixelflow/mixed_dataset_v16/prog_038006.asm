; DESCRIPTION: Places a white 110x61 rectangle at position (203, 12).
; PLAN: r0=203(x), r1=12(y), r2=110(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 110
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
