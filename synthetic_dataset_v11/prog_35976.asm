; DESCRIPTION: Places a cyan 112x119 rectangle at position (4, 133).
; PLAN: r0=4(x), r1=133(y), r2=112(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 133
LDI r2, 112
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
