; DESCRIPTION: Places a yellow 83x23 rectangle at position (19, 111).
; PLAN: r0=19(x), r1=111(y), r2=83(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 111
LDI r2, 83
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
