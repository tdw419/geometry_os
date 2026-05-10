; DESCRIPTION: Places a red 114x66 rectangle at position (326, 39).
; PLAN: r0=326(x), r1=39(y), r2=114(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 39
LDI r2, 114
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
