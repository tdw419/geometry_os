; DESCRIPTION: Places a magenta 20x78 rectangle at position (204, 57).
; PLAN: r0=204(x), r1=57(y), r2=20(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 57
LDI r2, 20
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
