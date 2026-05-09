; DESCRIPTION: Places a blue 22x112 rectangle at position (121, 84).
; PLAN: r0=121(x), r1=84(y), r2=22(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 84
LDI r2, 22
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
