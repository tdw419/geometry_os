; DESCRIPTION: Places a blue 10x72 rectangle at position (383, 66).
; PLAN: r0=383(x), r1=66(y), r2=10(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 66
LDI r2, 10
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
