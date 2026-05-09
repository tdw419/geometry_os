; DESCRIPTION: Places a white 55x96 rectangle at position (64, 156).
; PLAN: r0=64(x), r1=156(y), r2=55(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 156
LDI r2, 55
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
