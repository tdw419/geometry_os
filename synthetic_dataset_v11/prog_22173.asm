; DESCRIPTION: Places a magenta 100x43 rectangle at position (77, 204).
; PLAN: r0=77(x), r1=204(y), r2=100(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 204
LDI r2, 100
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
