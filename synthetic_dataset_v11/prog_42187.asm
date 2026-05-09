; DESCRIPTION: Places a magenta 62x86 rectangle at position (73, 111).
; PLAN: r0=73(x), r1=111(y), r2=62(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 111
LDI r2, 62
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
