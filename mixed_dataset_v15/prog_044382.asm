; DESCRIPTION: Places a magenta 84x55 rectangle at position (424, 135).
; PLAN: r0=424(x), r1=135(y), r2=84(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 135
LDI r2, 84
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
