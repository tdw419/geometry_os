; DESCRIPTION: Places a purple 28x75 rectangle at position (246, 2).
; PLAN: r0=246(x), r1=2(y), r2=28(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 2
LDI r2, 28
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
