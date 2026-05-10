; DESCRIPTION: Renders a blue box of size 111x62 starting at (374, 168).
; PLAN: r0=374(x), r1=168(y), r2=111(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 168
LDI r2, 111
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
