; DESCRIPTION: Renders a blue box of size 52x79 starting at (72, 111).
; PLAN: r0=72(x), r1=111(y), r2=52(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 111
LDI r2, 52
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
