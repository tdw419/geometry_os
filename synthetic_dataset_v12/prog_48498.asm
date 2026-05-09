; DESCRIPTION: Places a white 10x96 rectangle at position (238, 80).
; PLAN: r0=238(x), r1=80(y), r2=10(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 80
LDI r2, 10
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
