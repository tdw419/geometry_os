; DESCRIPTION: Places a green 19x105 rectangle at position (165, 84).
; PLAN: r0=165(x), r1=84(y), r2=19(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 84
LDI r2, 19
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
