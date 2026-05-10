; DESCRIPTION: Places a black 15x46 rectangle at position (308, 134).
; PLAN: r0=308(x), r1=134(y), r2=15(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 134
LDI r2, 15
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
