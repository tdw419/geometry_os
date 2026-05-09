; DESCRIPTION: Places a black 78x61 rectangle at position (162, 111).
; PLAN: r0=162(x), r1=111(y), r2=78(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 111
LDI r2, 78
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
