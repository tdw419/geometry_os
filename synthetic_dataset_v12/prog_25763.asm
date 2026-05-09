; DESCRIPTION: Renders a blue box of size 90x36 starting at (297, 82).
; PLAN: r0=297(x), r1=82(y), r2=90(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 82
LDI r2, 90
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
