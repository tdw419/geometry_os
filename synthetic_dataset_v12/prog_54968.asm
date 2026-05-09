; DESCRIPTION: Places a yellow 97x67 rectangle at position (148, 35).
; PLAN: r0=148(x), r1=35(y), r2=97(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 35
LDI r2, 97
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
