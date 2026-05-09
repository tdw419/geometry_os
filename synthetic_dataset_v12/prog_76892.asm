; DESCRIPTION: Places a magenta 81x19 rectangle at position (28, 209).
; PLAN: r0=28(x), r1=209(y), r2=81(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 209
LDI r2, 81
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
