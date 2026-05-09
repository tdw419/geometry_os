; DESCRIPTION: Places a black 108x31 rectangle at position (300, 164).
; PLAN: r0=300(x), r1=164(y), r2=108(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 164
LDI r2, 108
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
