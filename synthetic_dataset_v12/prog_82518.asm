; DESCRIPTION: Places a cyan 116x110 rectangle at position (215, 133).
; PLAN: r0=215(x), r1=133(y), r2=116(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 133
LDI r2, 116
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
