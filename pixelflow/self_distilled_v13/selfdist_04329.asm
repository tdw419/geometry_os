; DESCRIPTION: Places a blue 19x11 box at position (174, 135).
; PLAN: r0=174(x), r1=135(y), r2=19(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 135
LDI r2, 19
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
