; DESCRIPTION: Places a magenta 86x40 rectangle at position (267, 108).
; PLAN: r0=267(x), r1=108(y), r2=86(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 108
LDI r2, 86
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
