; DESCRIPTION: Places a magenta 94x18 rectangle at position (4, 189).
; PLAN: r0=4(x), r1=189(y), r2=94(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 189
LDI r2, 94
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
