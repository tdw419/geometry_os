; DESCRIPTION: Places a cyan 17x85 rectangle at position (28, 111).
; PLAN: r0=28(x), r1=111(y), r2=17(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 111
LDI r2, 17
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
