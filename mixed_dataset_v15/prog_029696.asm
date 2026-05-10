; DESCRIPTION: Places a cyan 100x96 rectangle at position (91, 133).
; PLAN: r0=91(x), r1=133(y), r2=100(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 133
LDI r2, 100
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
