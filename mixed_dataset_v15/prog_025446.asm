; DESCRIPTION: Places a cyan 49x116 rectangle at position (139, 48).
; PLAN: r0=139(x), r1=48(y), r2=49(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 48
LDI r2, 49
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
