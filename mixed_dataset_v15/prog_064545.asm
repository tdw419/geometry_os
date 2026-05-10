; DESCRIPTION: Places a magenta 44x57 rectangle at position (191, 155).
; PLAN: r0=191(x), r1=155(y), r2=44(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 155
LDI r2, 44
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
