; DESCRIPTION: Places a yellow 36x87 rectangle at position (194, 111).
; PLAN: r0=194(x), r1=111(y), r2=36(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 111
LDI r2, 36
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
