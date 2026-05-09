; DESCRIPTION: Places a orange 114x109 rectangle at position (29, 43).
; PLAN: r0=29(x), r1=43(y), r2=114(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 43
LDI r2, 114
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
