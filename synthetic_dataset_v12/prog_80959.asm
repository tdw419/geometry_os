; DESCRIPTION: Places a orange 34x117 rectangle at position (98, 111).
; PLAN: r0=98(x), r1=111(y), r2=34(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 111
LDI r2, 34
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
