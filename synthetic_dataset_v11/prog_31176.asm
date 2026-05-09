; DESCRIPTION: Renders a magenta box of size 119x48 starting at (110, 111).
; PLAN: r0=110(x), r1=111(y), r2=119(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 111
LDI r2, 119
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
