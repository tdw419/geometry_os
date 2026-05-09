; DESCRIPTION: Renders a purple box of size 90x84 starting at (76, 146).
; PLAN: r0=76(x), r1=146(y), r2=90(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 146
LDI r2, 90
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
