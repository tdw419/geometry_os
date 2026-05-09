; DESCRIPTION: Places a white 114x44 rectangle at position (127, 68).
; PLAN: r0=127(x), r1=68(y), r2=114(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 68
LDI r2, 114
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
