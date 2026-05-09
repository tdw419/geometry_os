; DESCRIPTION: Places a blue 30x81 rectangle at position (221, 111).
; PLAN: r0=221(x), r1=111(y), r2=30(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 111
LDI r2, 30
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
