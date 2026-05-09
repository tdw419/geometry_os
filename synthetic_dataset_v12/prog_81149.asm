; DESCRIPTION: Renders a purple box of size 12x78 starting at (298, 80).
; PLAN: r0=298(x), r1=80(y), r2=12(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 80
LDI r2, 12
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
