; DESCRIPTION: Places a magenta 42x70 rectangle at position (177, 104).
; PLAN: r0=177(x), r1=104(y), r2=42(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 104
LDI r2, 42
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
