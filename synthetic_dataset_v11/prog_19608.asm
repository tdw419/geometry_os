; DESCRIPTION: Places a magenta 20x97 rectangle at position (70, 113).
; PLAN: r0=70(x), r1=113(y), r2=20(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 113
LDI r2, 20
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
