; DESCRIPTION: Places a purple 74x119 rectangle at position (405, 48).
; PLAN: r0=405(x), r1=48(y), r2=74(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 48
LDI r2, 74
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
