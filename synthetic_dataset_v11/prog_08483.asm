; DESCRIPTION: Places a magenta 48x82 rectangle at position (30, 128).
; PLAN: r0=30(x), r1=128(y), r2=48(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 128
LDI r2, 48
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
