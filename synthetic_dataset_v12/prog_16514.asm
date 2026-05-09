; DESCRIPTION: Places a magenta 25x34 rectangle at position (409, 166).
; PLAN: r0=409(x), r1=166(y), r2=25(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 166
LDI r2, 25
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
