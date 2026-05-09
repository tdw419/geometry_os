; DESCRIPTION: Places a magenta 19x24 rectangle at position (85, 192).
; PLAN: r0=85(x), r1=192(y), r2=19(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 192
LDI r2, 19
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
