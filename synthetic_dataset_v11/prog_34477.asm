; DESCRIPTION: Places a magenta 97x90 rectangle at position (154, 157).
; PLAN: r0=154(x), r1=157(y), r2=97(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 157
LDI r2, 97
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
