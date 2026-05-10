; DESCRIPTION: Places a white 87x48 rectangle at position (381, 88).
; PLAN: r0=381(x), r1=88(y), r2=87(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 88
LDI r2, 87
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
