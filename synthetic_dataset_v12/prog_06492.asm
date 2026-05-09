; DESCRIPTION: Places a blue 94x116 rectangle at position (194, 101).
; PLAN: r0=194(x), r1=101(y), r2=94(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 101
LDI r2, 94
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
