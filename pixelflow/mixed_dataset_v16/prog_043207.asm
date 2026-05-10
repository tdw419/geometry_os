; DESCRIPTION: Places a magenta 39x100 rectangle at position (191, 15).
; PLAN: r0=191(x), r1=15(y), r2=39(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 15
LDI r2, 39
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
