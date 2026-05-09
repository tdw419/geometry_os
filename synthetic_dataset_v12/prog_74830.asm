; DESCRIPTION: Places a magenta 57x71 rectangle at position (270, 17).
; PLAN: r0=270(x), r1=17(y), r2=57(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 17
LDI r2, 57
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
