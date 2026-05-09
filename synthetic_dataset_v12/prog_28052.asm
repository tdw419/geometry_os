; DESCRIPTION: Places a magenta 25x94 rectangle at position (196, 113).
; PLAN: r0=196(x), r1=113(y), r2=25(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 113
LDI r2, 25
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
