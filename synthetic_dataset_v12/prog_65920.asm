; DESCRIPTION: Places a white 32x56 rectangle at position (281, 116).
; PLAN: r0=281(x), r1=116(y), r2=32(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 116
LDI r2, 32
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
