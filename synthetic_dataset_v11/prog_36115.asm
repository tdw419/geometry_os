; DESCRIPTION: Places a yellow 67x28 rectangle at position (10, 3).
; PLAN: r0=10(x), r1=3(y), r2=67(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 3
LDI r2, 67
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
