; DESCRIPTION: Places a green 107x40 rectangle at position (37, 111).
; PLAN: r0=37(x), r1=111(y), r2=107(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 111
LDI r2, 107
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
