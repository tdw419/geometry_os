; DESCRIPTION: Places a magenta 115x99 rectangle at position (104, 156).
; PLAN: r0=104(x), r1=156(y), r2=115(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 156
LDI r2, 115
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
