; DESCRIPTION: Places a blue 67x19 rectangle at position (319, 46).
; PLAN: r0=319(x), r1=46(y), r2=67(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 46
LDI r2, 67
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
