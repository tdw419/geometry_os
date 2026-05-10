; DESCRIPTION: Renders a blue box of size 97x70 starting at (243, 87).
; PLAN: r0=243(x), r1=87(y), r2=97(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 87
LDI r2, 97
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
