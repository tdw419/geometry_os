; DESCRIPTION: Renders a purple box of size 90x72 starting at (270, 28).
; PLAN: r0=270(x), r1=28(y), r2=90(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 28
LDI r2, 90
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
