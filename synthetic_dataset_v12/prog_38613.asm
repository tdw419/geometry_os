; DESCRIPTION: Places a yellow 35x42 rectangle at position (221, 111).
; PLAN: r0=221(x), r1=111(y), r2=35(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 111
LDI r2, 35
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
