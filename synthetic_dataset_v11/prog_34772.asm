; DESCRIPTION: Places a purple 112x113 rectangle at position (79, 135).
; PLAN: r0=79(x), r1=135(y), r2=112(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 135
LDI r2, 112
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
