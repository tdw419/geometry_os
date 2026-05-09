; DESCRIPTION: Places a magenta 11x21 rectangle at position (221, 26).
; PLAN: r0=221(x), r1=26(y), r2=11(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 26
LDI r2, 11
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
