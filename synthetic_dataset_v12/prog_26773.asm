; DESCRIPTION: Renders a blue box of size 16x50 starting at (163, 44).
; PLAN: r0=163(x), r1=44(y), r2=16(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 44
LDI r2, 16
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
