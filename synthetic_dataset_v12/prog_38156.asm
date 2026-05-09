; DESCRIPTION: Places a white 114x84 rectangle at position (279, 21).
; PLAN: r0=279(x), r1=21(y), r2=114(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 21
LDI r2, 114
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
