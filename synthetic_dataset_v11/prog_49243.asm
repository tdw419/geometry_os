; DESCRIPTION: Renders a purple box of size 21x50 starting at (160, 175).
; PLAN: r0=160(x), r1=175(y), r2=21(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 175
LDI r2, 21
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
