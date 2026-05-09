; DESCRIPTION: Places a magenta 43x44 rectangle at position (0, 157).
; PLAN: r0=0(x), r1=157(y), r2=43(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 157
LDI r2, 43
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
