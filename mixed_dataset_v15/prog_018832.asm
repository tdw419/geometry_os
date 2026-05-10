; DESCRIPTION: Places a orange 49x54 rectangle at position (353, 111).
; PLAN: r0=353(x), r1=111(y), r2=49(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 111
LDI r2, 49
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
