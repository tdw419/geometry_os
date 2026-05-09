; DESCRIPTION: Renders a blue box of size 102x62 starting at (298, 94).
; PLAN: r0=298(x), r1=94(y), r2=102(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 94
LDI r2, 102
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
