; DESCRIPTION: Places a cyan 58x60 rectangle at position (185, 133).
; PLAN: r0=185(x), r1=133(y), r2=58(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 133
LDI r2, 58
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
