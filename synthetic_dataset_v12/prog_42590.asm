; DESCRIPTION: Places a magenta 15x37 rectangle at position (424, 128).
; PLAN: r0=424(x), r1=128(y), r2=15(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 128
LDI r2, 15
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
