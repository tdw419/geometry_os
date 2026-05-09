; DESCRIPTION: Places a white 25x60 rectangle at position (155, 166).
; PLAN: r0=155(x), r1=166(y), r2=25(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 166
LDI r2, 25
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
