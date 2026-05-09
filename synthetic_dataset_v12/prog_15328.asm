; DESCRIPTION: Places a magenta 106x28 rectangle at position (3, 108).
; PLAN: r0=3(x), r1=108(y), r2=106(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 108
LDI r2, 106
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
