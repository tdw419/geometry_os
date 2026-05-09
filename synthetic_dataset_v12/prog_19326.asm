; DESCRIPTION: Renders a blue box of size 21x87 starting at (385, 44).
; PLAN: r0=385(x), r1=44(y), r2=21(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 44
LDI r2, 21
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
