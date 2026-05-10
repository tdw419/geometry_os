; DESCRIPTION: Places a magenta 105x99 rectangle at position (358, 111).
; PLAN: r0=358(x), r1=111(y), r2=105(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 111
LDI r2, 105
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
