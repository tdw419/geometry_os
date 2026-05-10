; DESCRIPTION: Places a blue 31x115 box at position (293, 135).
; PLAN: r0=293(x), r1=135(y), r2=31(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 135
LDI r2, 31
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
