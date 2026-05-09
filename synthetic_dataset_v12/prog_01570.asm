; DESCRIPTION: Renders a purple box of size 108x30 starting at (209, 205).
; PLAN: r0=209(x), r1=205(y), r2=108(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 205
LDI r2, 108
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
