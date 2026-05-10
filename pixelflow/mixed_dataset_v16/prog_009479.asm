; DESCRIPTION: Places a white 67x96 rectangle at position (356, 119).
; PLAN: r0=356(x), r1=119(y), r2=67(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 119
LDI r2, 67
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
