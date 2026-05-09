; DESCRIPTION: Places a black 14x31 rectangle at position (120, 111).
; PLAN: r0=120(x), r1=111(y), r2=14(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 111
LDI r2, 14
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
