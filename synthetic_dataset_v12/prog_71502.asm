; DESCRIPTION: Renders a magenta box of size 62x116 starting at (354, 111).
; PLAN: r0=354(x), r1=111(y), r2=62(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 111
LDI r2, 62
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
