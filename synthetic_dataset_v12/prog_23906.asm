; DESCRIPTION: Places a magenta 38x79 rectangle at position (128, 111).
; PLAN: r0=128(x), r1=111(y), r2=38(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 111
LDI r2, 38
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
