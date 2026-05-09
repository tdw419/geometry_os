; DESCRIPTION: Places a green 67x66 rectangle at position (151, 25).
; PLAN: r0=151(x), r1=25(y), r2=67(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 25
LDI r2, 67
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
