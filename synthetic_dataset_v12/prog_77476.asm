; DESCRIPTION: Places a magenta 92x59 rectangle at position (350, 84).
; PLAN: r0=350(x), r1=84(y), r2=92(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 84
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
