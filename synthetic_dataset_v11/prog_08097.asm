; DESCRIPTION: Places a magenta 108x48 rectangle at position (109, 189).
; PLAN: r0=109(x), r1=189(y), r2=108(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 189
LDI r2, 108
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
