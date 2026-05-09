; DESCRIPTION: Places a black 76x116 rectangle at position (419, 135).
; PLAN: r0=419(x), r1=135(y), r2=76(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 135
LDI r2, 76
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
