; DESCRIPTION: Places a magenta 90x91 rectangle at position (158, 111).
; PLAN: r0=158(x), r1=111(y), r2=90(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 111
LDI r2, 90
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
