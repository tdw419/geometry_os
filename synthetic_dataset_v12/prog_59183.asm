; DESCRIPTION: Places a blue 114x114 rectangle at position (298, 39).
; PLAN: r0=298(x), r1=39(y), r2=114(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 39
LDI r2, 114
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
