; DESCRIPTION: Places a magenta 71x19 rectangle at position (57, 149).
; PLAN: r0=57(x), r1=149(y), r2=71(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 149
LDI r2, 71
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
