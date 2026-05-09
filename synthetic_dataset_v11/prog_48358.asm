; DESCRIPTION: Places a white 21x67 rectangle at position (18, 48).
; PLAN: r0=18(x), r1=48(y), r2=21(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 48
LDI r2, 21
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
