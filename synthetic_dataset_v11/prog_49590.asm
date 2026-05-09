; DESCRIPTION: Places a magenta 104x97 rectangle at position (42, 150).
; PLAN: r0=42(x), r1=150(y), r2=104(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 150
LDI r2, 104
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
