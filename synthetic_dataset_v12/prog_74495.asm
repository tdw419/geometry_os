; DESCRIPTION: Places a black 97x113 rectangle at position (412, 76).
; PLAN: r0=412(x), r1=76(y), r2=97(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 76
LDI r2, 97
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
