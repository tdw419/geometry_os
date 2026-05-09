; DESCRIPTION: Places a yellow 97x59 rectangle at position (37, 162).
; PLAN: r0=37(x), r1=162(y), r2=97(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 162
LDI r2, 97
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
