; DESCRIPTION: Places a magenta 63x83 rectangle at position (87, 154).
; PLAN: r0=87(x), r1=154(y), r2=63(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 154
LDI r2, 63
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
