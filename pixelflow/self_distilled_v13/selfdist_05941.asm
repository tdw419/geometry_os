; DESCRIPTION: Places a magenta 106x113 box at position (16, 132).
; PLAN: r0=16(x), r1=132(y), r2=106(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 132
LDI r2, 106
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
