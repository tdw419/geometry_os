; DESCRIPTION: Places a magenta 71x69 rectangle at position (44, 175).
; PLAN: r0=44(x), r1=175(y), r2=71(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 175
LDI r2, 71
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
