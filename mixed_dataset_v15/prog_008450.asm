; DESCRIPTION: Places a black 85x108 rectangle at position (69, 143).
; PLAN: r0=69(x), r1=143(y), r2=85(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 143
LDI r2, 85
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
