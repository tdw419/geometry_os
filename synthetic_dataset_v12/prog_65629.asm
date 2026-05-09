; DESCRIPTION: Places a magenta 85x84 rectangle at position (237, 48).
; PLAN: r0=237(x), r1=48(y), r2=85(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 48
LDI r2, 85
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
