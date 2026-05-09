; DESCRIPTION: Places a magenta 11x57 rectangle at position (268, 28).
; PLAN: r0=268(x), r1=28(y), r2=11(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 28
LDI r2, 11
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
