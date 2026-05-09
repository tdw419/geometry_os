; DESCRIPTION: Places a magenta 44x72 rectangle at position (36, 101).
; PLAN: r0=36(x), r1=101(y), r2=44(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 101
LDI r2, 44
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
