; DESCRIPTION: Places a black 95x82 rectangle at position (17, 50).
; PLAN: r0=17(x), r1=50(y), r2=95(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 50
LDI r2, 95
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
