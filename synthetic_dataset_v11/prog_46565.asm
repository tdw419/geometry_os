; DESCRIPTION: Places a magenta 37x25 rectangle at position (57, 20).
; PLAN: r0=57(x), r1=20(y), r2=37(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 20
LDI r2, 37
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
