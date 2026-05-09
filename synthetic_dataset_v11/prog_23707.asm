; DESCRIPTION: Places a cyan 59x67 rectangle at position (10, 114).
; PLAN: r0=10(x), r1=114(y), r2=59(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 114
LDI r2, 59
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
