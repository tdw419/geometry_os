; DESCRIPTION: Places a magenta 111x42 rectangle at position (137, 176).
; PLAN: r0=137(x), r1=176(y), r2=111(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 176
LDI r2, 111
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
