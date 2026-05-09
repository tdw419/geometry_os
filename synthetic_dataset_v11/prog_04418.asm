; DESCRIPTION: Renders a blue box of size 23x95 starting at (110, 111).
; PLAN: r0=110(x), r1=111(y), r2=23(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 111
LDI r2, 23
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
