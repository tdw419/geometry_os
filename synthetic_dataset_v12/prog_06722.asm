; DESCRIPTION: Places a magenta 66x22 rectangle at position (191, 28).
; PLAN: r0=191(x), r1=28(y), r2=66(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 28
LDI r2, 66
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
