; DESCRIPTION: Renders a blue box of size 117x87 starting at (90, 65).
; PLAN: r0=90(x), r1=65(y), r2=117(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 65
LDI r2, 117
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
