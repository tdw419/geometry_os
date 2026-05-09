; DESCRIPTION: Places a magenta 45x44 rectangle at position (157, 179).
; PLAN: r0=157(x), r1=179(y), r2=45(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 179
LDI r2, 45
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
