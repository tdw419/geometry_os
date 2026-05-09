; DESCRIPTION: Places a magenta 103x114 rectangle at position (86, 111).
; PLAN: r0=86(x), r1=111(y), r2=103(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 111
LDI r2, 103
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
