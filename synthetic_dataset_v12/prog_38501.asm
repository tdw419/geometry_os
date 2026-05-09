; DESCRIPTION: Places a magenta 107x74 rectangle at position (279, 100).
; PLAN: r0=279(x), r1=100(y), r2=107(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 100
LDI r2, 107
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
