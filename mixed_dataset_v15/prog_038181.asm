; DESCRIPTION: Places a green 118x55 rectangle at position (203, 111).
; PLAN: r0=203(x), r1=111(y), r2=118(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 111
LDI r2, 118
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
