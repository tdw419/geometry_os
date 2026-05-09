; DESCRIPTION: Places a green 116x56 rectangle at position (68, 111).
; PLAN: r0=68(x), r1=111(y), r2=116(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 111
LDI r2, 116
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
