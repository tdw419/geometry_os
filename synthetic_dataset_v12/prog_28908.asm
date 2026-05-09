; DESCRIPTION: Places a magenta 59x65 rectangle at position (261, 111).
; PLAN: r0=261(x), r1=111(y), r2=59(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 111
LDI r2, 59
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
