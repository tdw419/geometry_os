; DESCRIPTION: Places a black 70x16 rectangle at position (105, 82).
; PLAN: r0=105(x), r1=82(y), r2=70(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 82
LDI r2, 70
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
