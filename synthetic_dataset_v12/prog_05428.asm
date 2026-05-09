; DESCRIPTION: Places a magenta 40x113 rectangle at position (279, 61).
; PLAN: r0=279(x), r1=61(y), r2=40(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 61
LDI r2, 40
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
