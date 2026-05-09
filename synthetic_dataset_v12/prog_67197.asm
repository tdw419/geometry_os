; DESCRIPTION: Places a black 30x17 rectangle at position (17, 143).
; PLAN: r0=17(x), r1=143(y), r2=30(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 143
LDI r2, 30
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
