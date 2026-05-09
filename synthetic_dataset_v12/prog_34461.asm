; DESCRIPTION: Places a orange 58x85 rectangle at position (279, 111).
; PLAN: r0=279(x), r1=111(y), r2=58(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 111
LDI r2, 58
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
