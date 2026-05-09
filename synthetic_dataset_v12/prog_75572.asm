; DESCRIPTION: Places a purple 103x105 rectangle at position (15, 44).
; PLAN: r0=15(x), r1=44(y), r2=103(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 44
LDI r2, 103
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
