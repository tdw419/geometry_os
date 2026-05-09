; DESCRIPTION: Places a cyan 116x29 rectangle at position (76, 200).
; PLAN: r0=76(x), r1=200(y), r2=116(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 200
LDI r2, 116
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
