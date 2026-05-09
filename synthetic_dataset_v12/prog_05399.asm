; DESCRIPTION: Places a magenta 72x39 rectangle at position (163, 75).
; PLAN: r0=163(x), r1=75(y), r2=72(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 75
LDI r2, 72
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
