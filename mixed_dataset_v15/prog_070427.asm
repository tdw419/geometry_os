; DESCRIPTION: Places a orange 79x37 rectangle at position (427, 111).
; PLAN: r0=427(x), r1=111(y), r2=79(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 111
LDI r2, 79
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
