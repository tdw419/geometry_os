; DESCRIPTION: Renders a purple box of size 90x37 starting at (287, 143).
; PLAN: r0=287(x), r1=143(y), r2=90(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 143
LDI r2, 90
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
