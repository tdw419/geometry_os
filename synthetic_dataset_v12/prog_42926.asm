; DESCRIPTION: Places a magenta 97x90 rectangle at position (37, 154).
; PLAN: r0=37(x), r1=154(y), r2=97(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 154
LDI r2, 97
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
