; DESCRIPTION: Places a magenta 67x39 rectangle at position (159, 46).
; PLAN: r0=159(x), r1=46(y), r2=67(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 46
LDI r2, 67
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
