; DESCRIPTION: Places a orange 71x112 rectangle at position (439, 111).
; PLAN: r0=439(x), r1=111(y), r2=71(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 111
LDI r2, 71
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
