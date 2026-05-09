; DESCRIPTION: Places a white 54x13 rectangle at position (194, 111).
; PLAN: r0=194(x), r1=111(y), r2=54(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 111
LDI r2, 54
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
