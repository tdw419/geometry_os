; DESCRIPTION: Renders a blue box of size 90x21 starting at (25, 224).
; PLAN: r0=25(x), r1=224(y), r2=90(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 224
LDI r2, 90
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
