; DESCRIPTION: Places a purple 103x75 rectangle at position (57, 112).
; PLAN: r0=57(x), r1=112(y), r2=103(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 112
LDI r2, 103
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
