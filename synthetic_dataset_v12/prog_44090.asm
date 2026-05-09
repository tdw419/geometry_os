; DESCRIPTION: Places a magenta 16x59 rectangle at position (267, 185).
; PLAN: r0=267(x), r1=185(y), r2=16(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 185
LDI r2, 16
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
