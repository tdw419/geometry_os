; DESCRIPTION: Places a magenta 97x29 rectangle at position (113, 215).
; PLAN: r0=113(x), r1=215(y), r2=97(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 215
LDI r2, 97
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
