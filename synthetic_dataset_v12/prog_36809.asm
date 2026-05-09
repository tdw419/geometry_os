; DESCRIPTION: Places a magenta 22x70 rectangle at position (388, 113).
; PLAN: r0=388(x), r1=113(y), r2=22(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 113
LDI r2, 22
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
