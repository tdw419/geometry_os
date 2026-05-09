; DESCRIPTION: Places a blue 60x113 rectangle at position (5, 135).
; PLAN: r0=5(x), r1=135(y), r2=60(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 135
LDI r2, 60
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
