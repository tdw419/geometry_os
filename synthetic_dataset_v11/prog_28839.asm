; DESCRIPTION: Places a black 30x82 rectangle at position (39, 80).
; PLAN: r0=39(x), r1=80(y), r2=30(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 80
LDI r2, 30
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
