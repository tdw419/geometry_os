; DESCRIPTION: Renders a blue box of size 36x92 starting at (442, 111).
; PLAN: r0=442(x), r1=111(y), r2=36(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 111
LDI r2, 36
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
