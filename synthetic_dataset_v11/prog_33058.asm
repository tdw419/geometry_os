; DESCRIPTION: Places a black 80x94 rectangle at position (153, 111).
; PLAN: r0=153(x), r1=111(y), r2=80(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 111
LDI r2, 80
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
