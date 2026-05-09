; DESCRIPTION: Places a magenta 28x84 rectangle at position (11, 142).
; PLAN: r0=11(x), r1=142(y), r2=28(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 142
LDI r2, 28
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
