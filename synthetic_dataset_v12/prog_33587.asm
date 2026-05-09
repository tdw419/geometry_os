; DESCRIPTION: Places a magenta 19x45 rectangle at position (77, 189).
; PLAN: r0=77(x), r1=189(y), r2=19(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 189
LDI r2, 19
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
