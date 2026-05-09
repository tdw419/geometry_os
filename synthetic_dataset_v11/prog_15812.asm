; DESCRIPTION: Places a purple 118x113 rectangle at position (90, 40).
; PLAN: r0=90(x), r1=40(y), r2=118(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 40
LDI r2, 118
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
