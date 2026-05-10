; DESCRIPTION: Places a cyan 67x57 rectangle at position (25, 175).
; PLAN: r0=25(x), r1=175(y), r2=67(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 175
LDI r2, 67
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
