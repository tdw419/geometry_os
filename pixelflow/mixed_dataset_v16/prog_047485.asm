; DESCRIPTION: Places a cyan 116x74 rectangle at position (310, 112).
; PLAN: r0=310(x), r1=112(y), r2=116(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 112
LDI r2, 116
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
