; DESCRIPTION: Renders a blue box of size 23x25 starting at (47, 192).
; PLAN: r0=47(x), r1=192(y), r2=23(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 192
LDI r2, 23
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
