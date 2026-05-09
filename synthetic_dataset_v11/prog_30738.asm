; DESCRIPTION: Places a magenta 111x78 rectangle at position (8, 133).
; PLAN: r0=8(x), r1=133(y), r2=111(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 133
LDI r2, 111
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
