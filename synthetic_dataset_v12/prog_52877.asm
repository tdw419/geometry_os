; DESCRIPTION: Places a blue 44x105 rectangle at position (166, 66).
; PLAN: r0=166(x), r1=66(y), r2=44(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 66
LDI r2, 44
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
