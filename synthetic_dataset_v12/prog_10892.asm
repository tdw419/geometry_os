; DESCRIPTION: Places a purple 25x119 rectangle at position (425, 20).
; PLAN: r0=425(x), r1=20(y), r2=25(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 20
LDI r2, 25
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
