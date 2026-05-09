; DESCRIPTION: Places a white 114x18 rectangle at position (63, 97).
; PLAN: r0=63(x), r1=97(y), r2=114(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 97
LDI r2, 114
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
