; DESCRIPTION: Places a magenta 93x28 rectangle at position (370, 25).
; PLAN: r0=370(x), r1=25(y), r2=93(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 25
LDI r2, 93
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
