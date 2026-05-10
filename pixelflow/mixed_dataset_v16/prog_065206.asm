; DESCRIPTION: Places a green 114x46 rectangle at position (66, 135).
; PLAN: r0=66(x), r1=135(y), r2=114(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 135
LDI r2, 114
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
