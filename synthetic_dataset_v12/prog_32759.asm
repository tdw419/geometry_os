; DESCRIPTION: Places a white 32x32 rectangle at position (203, 138).
; PLAN: r0=203(x), r1=138(y), r2=32(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 138
LDI r2, 32
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
