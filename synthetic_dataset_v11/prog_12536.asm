; DESCRIPTION: Places a white 97x108 rectangle at position (121, 144).
; PLAN: r0=121(x), r1=144(y), r2=97(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 144
LDI r2, 97
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
