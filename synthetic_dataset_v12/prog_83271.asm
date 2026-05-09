; DESCRIPTION: Places a black 24x83 rectangle at position (272, 120).
; PLAN: r0=272(x), r1=120(y), r2=24(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 120
LDI r2, 24
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
