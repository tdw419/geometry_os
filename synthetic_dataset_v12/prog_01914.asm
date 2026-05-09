; DESCRIPTION: Renders a magenta box of size 72x62 starting at (327, 111).
; PLAN: r0=327(x), r1=111(y), r2=72(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 111
LDI r2, 72
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
