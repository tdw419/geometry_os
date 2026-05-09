; DESCRIPTION: Places a green 45x76 rectangle at position (424, 157).
; PLAN: r0=424(x), r1=157(y), r2=45(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 157
LDI r2, 45
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
