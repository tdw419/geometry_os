; DESCRIPTION: Places a cyan 67x37 rectangle at position (379, 166).
; PLAN: r0=379(x), r1=166(y), r2=67(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 166
LDI r2, 67
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
