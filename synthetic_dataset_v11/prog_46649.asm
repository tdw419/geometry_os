; DESCRIPTION: Places a blue 14x113 rectangle at position (127, 131).
; PLAN: r0=127(x), r1=131(y), r2=14(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 131
LDI r2, 14
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
