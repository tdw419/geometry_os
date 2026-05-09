; DESCRIPTION: Places a purple 16x16 rectangle at position (55, 111).
; PLAN: r0=55(x), r1=111(y), r2=16(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 111
LDI r2, 16
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
