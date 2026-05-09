; DESCRIPTION: Places a magenta 85x44 rectangle at position (248, 128).
; PLAN: r0=248(x), r1=128(y), r2=85(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 128
LDI r2, 85
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
