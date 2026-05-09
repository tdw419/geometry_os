; DESCRIPTION: Places a blue 100x116 rectangle at position (73, 5).
; PLAN: r0=73(x), r1=5(y), r2=100(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 5
LDI r2, 100
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
