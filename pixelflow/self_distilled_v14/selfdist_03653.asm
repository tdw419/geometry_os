; DESCRIPTION: Creates a yellow filled rectangle of size 97x13 starting at (387, 135).
; PLAN: r0=387(x), r1=135(y), r2=97(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 135
LDI r2, 97
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
