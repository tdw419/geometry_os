; DESCRIPTION: Renders a green box of size 119x42 starting at (15, 111).
; PLAN: r0=15(x), r1=111(y), r2=119(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 111
LDI r2, 119
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
