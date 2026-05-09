; DESCRIPTION: Places a green 49x36 rectangle at position (75, 111).
; PLAN: r0=75(x), r1=111(y), r2=49(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 111
LDI r2, 49
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
