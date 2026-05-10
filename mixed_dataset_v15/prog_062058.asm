; DESCRIPTION: Places a magenta 32x11 rectangle at position (200, 21).
; PLAN: r0=200(x), r1=21(y), r2=32(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 21
LDI r2, 32
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
