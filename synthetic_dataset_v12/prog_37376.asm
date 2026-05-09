; DESCRIPTION: Renders a blue box of size 29x63 starting at (475, 111).
; PLAN: r0=475(x), r1=111(y), r2=29(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 111
LDI r2, 29
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
