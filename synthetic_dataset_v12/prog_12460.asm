; DESCRIPTION: Places a white 29x58 rectangle at position (356, 77).
; PLAN: r0=356(x), r1=77(y), r2=29(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 77
LDI r2, 29
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
