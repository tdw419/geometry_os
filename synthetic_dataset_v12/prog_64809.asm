; DESCRIPTION: Places a cyan 30x82 rectangle at position (349, 129).
; PLAN: r0=349(x), r1=129(y), r2=30(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 129
LDI r2, 30
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
