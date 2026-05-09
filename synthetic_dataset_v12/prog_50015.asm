; DESCRIPTION: Places a blue 10x116 rectangle at position (76, 114).
; PLAN: r0=76(x), r1=114(y), r2=10(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 114
LDI r2, 10
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
