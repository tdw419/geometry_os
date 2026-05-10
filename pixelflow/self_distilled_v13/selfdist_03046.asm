; DESCRIPTION: Places a red 37x106 box at position (159, 111).
; PLAN: r0=159(x), r1=111(y), r2=37(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 111
LDI r2, 37
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
