; DESCRIPTION: Renders a blue box of size 44x87 starting at (340, 99).
; PLAN: r0=340(x), r1=99(y), r2=44(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 99
LDI r2, 44
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
